/*
 * Copyright 2012 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 *  Ben Lucchesi
 *  ben@granicus.com or benlucchesi@gmail.com
 */

package com.granicus.grails.plugins.cookiesession;

import org.apache.log4j.Logger;

public class ExceptionCondenser implements SessionPersistenceListener{
  
  final static Logger log = Logger.getLogger(ExceptionCondenser.class.getName());

  public void afterSessionRestored( SerializableSession session ){

  }

  public void beforeSessionSaved( SerializableSession session ){
    // loop through the attributes and condense each exception to just its exception
    for( String key : session.getValueNames() ){
      if( session.getAttribute(key) instanceof Exception ){
        log.trace("condensing exception: " + key);
        Exception excp = (Exception)session.getAttribute(key);
        session.setAttribute(key, excp.getMessage());
      }
    }
  }
}
