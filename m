Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBAC4071C4
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591070; cv=none; b=Rba6MXNTTr0tgwZUQKW1lstpPvDI4et1EAyvNwPY0YqPmMl6k/pcfo0awhiFuH6rWpH0DQj4lXDmw77UzLOEd2V2JoGfYjukvsfZcdV1oR6gJszQ6OoehsYPNmUiJ8+zGra9tWsZHiKi9dDqkZIm9jIy8e3f7jjEeyzMguRbpao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591070; c=relaxed/simple;
	bh=LTTjm0eaRmsyX56miwgBW0BtH4BQHTpfGzACaKWvbCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NeiR6ZoXniQyfp6UBtn+/lVstOia6W9c+cXuJBkkkg8NkFBkMtxEMtABkKXpks7YrE7N7/gD3u8SVJafzBHszJGUzi9xMG1gHAWWIlu7vblG2ub82MH12T3OU2kEjBbucYPLdYmb7L0pyB8ZjIQPmg9cNtGdg95R0OYvbR5yjo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l/fi6Flw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l/fi6Flw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc73e322dbso15541625ad.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591068; x=1784195868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=;
        b=l/fi6Flw8l8KrcUNyKCdQPXhN3hvojtv3XeaU65obc41QoIQyVwg+FSWBSE5cgDWCn
         WPhb4kPqRVoO/Clas6Wa6M7m21tzd+mMtjXfTp5I4iZjZ2APQl4vWIwVaUjzurxB0SAk
         Ufyr+IATvPbkuddo/BbAZZSxXbJFPYspFrXdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591068; x=1784195868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHa+N6e2rl6wq1SgVHpliLB/r9n0zCkbXlX81Kt00W0=;
        b=IXlziPYwMqhsYwCtmnXRV6g0FAXr1I0Ub3ygj2VYd8rmBD13NBKEZEnTKFtmEgDS1L
         Dw1ToShPlD0HMRIXkNNo7GSmETWrh2NmGYdcaTcJqPXPcGKZw3+4n7wIlssi94sr0yRr
         XgVIPCvUBImgSPnJeEMicsnci5ohfkpgNqlPJTi+LA5Bg+5gZ3Fk9IbBbg2wCIIMG0+T
         EobR7TGi/e7Z4BIHBNALEPwrRAJVx72FlCvwLX04mXX4JVvb8/Wi6RZSt4v5GROVAMfI
         kV03Pm3ji9H3DPatecZfn0ZB/HTHjUB4Fxvymur0Us9+dYGBCnY8XHgrUEf1rDfwPOHC
         kjWg==
X-Forwarded-Encrypted: i=1; AHgh+RpmfXvcwjes5ngFIEaeMNB4jKxMU31x8DsswJ86GDSZkpthqvc7082YJ9E8Sx5mhbZqQ4PYejUX+w4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUxgOoxCOyw6MjEegaEcHcvSf5JWTQLvHrVt6mKcj7nrLiAep
	gYjkEisglXQUedHv/MxuOS932ZcHtbfPB+L8TRkeDiChU4am37+DG8Pc58sb231Txg==
X-Gm-Gg: AfdE7cl2vilu3JhhCeYBBpe6j3GsfX0WGc4qiRrIbPcsza5Qas6ljWeBJeboKWxtCX4
	vUEIxqLrzrDrD6PbdWIIV4yLGePEvQRs8YhWsCMrDxukOLIcHPBB2bFoxXWFH9IfXHGzVLZSS4s
	F6JbiAXM0ez71upGC/DK/zcXQZ6kJ1dwd7wd6HfGrbdyvzEBJM3v+vJt0h4aVVGmrfr2rAEkJYf
	0XUGMcZL58MYuibA4KSXzrRkDj2cNuo9R6Iy6/yZS4Z6DG1K4008W6pWRe4XCnOrFseNcUFdUat
	X3npQ8B0gKQ2fdG4WS4GYJ7VrjM+e+R8PeyVE2jqbUXW9AQ7j1CW+EDJkQCXGujPr8i4iM26CwI
	XUk/2KpRCFXIfCrKzHYPWOVXak4Ms2T8UiHgScCj2medqxJRT+LdPohB+fhsxVtlThtapYIH4zX
	lJd1KSk7BYdH1T/sY3sSyfwI+kT+fmNQfxR+UtdzG5DeDDLdQzw8ONA+5gb+tZnTvzBlmyQ2WbE
	12EwBxG
X-Received: by 2002:a17:903:46cc:b0:2c9:e261:95c4 with SMTP id d9443c01a7336-2ccea464f02mr67670245ad.30.1783591068202;
        Thu, 09 Jul 2026 02:57:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 02/14] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Thu,  9 Jul 2026 17:57:07 +0800
Message-ID: <20260709095726.704448-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 3e3e19ef66a9..7e7ad3635806 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
+ * @port: Pointer to the target port firmware node
+ * @prev: Previous endpoint node or %NULL to get the first
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer. Note that this function also puts a reference to @prev
+ * unconditionally.
+ *
+ * Return: an endpoint firmware node pointer or %NULL if no more endpoints
+ * are available.
+ */
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
+							  struct fwnode_handle *prev)
+{
+	do {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (fwnode_name_eq(prev, "endpoint"))
+			break;
+	} while (prev);
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index e04901c0bd8f..931e703393cb 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -506,6 +506,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog

