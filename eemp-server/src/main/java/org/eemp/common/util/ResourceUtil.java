package org.eemp.common.util;

import java.io.IOException;
import java.io.InputStream;

public class ResourceUtil {
    public InputStream getResource(String fileName) throws IOException {
        InputStream in = this.getClass().getClassLoader().getResourceAsStream(fileName);
        return in;
    }
}
