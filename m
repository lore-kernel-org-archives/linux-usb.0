Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850C53F825A
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511344; cv=none; b=A4AcdQBR9COIrJJpXuqQ+aYDEhm6LMuCh6wUVM60QgpN0k3rGYnK4bW+kY+QHBiCbIYYHKaOhalywnDEg5sbbs3GIr6tUEtJP0McXctJ1CmAML9ZGL+yd504RmBqtBvTIxnxCXSQzIGJpZfVAeLdqQtctbPeV7Doqffrw/4uWWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511344; c=relaxed/simple;
	bh=GQw0KwPblzk4iaOngMKEkViVUNWR4x75q4Pko/xlHfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJB+UL4uMRK1d7cZMhDDDLhTzoV/Qs2a0759o7XXHkIfOAA6GIC8g7vI/KVOq+hVza7Lmnjxdb0SN8TFQisBtV6Sq1BrZRw7ec1xB8YFGX3GcfwsZQLUPRfKDSrAqRTIt/qBSHlgJsXLMARQjEMUOP2wkbgFv4Cg9twGNfE0+MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YzzQLh/R; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YzzQLh/R"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so831132a12.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511341; x=1789116141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=;
        b=YzzQLh/R6tpmsB/n+660LvxPg1f9O+pN6SBHytYsV+b0XYOLbwCxFOEA1bPDhvXcnb
         E3kJZL6kO2gUbjqUxXOuvUXY6xvGiz5hoExGxv9HqTrIFXzT+lVqh7ifU/D16j/+K27+
         r4wWFrtoiQq0Yzel2h+NHf35/kJ4gXqPeBaRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511341; x=1789116141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pQBHHD4SDVq3Y8lclcFUxJTow0FC5oCzcVfD5O1aqE=;
        b=pnAXFuMOvXU7P5D+2BOtpZf8/Dzh5aWv5It2BPWWTV/ZpkkdgXZZ9rIz9679PJ1IY5
         IMQRm25OOQdSZXPKOLVGr5XMb9dH+pQKCfdhQ62atgjJkTafItwpZb9LBNStB1P+c2yb
         EWN5SlJ66MCp2I8s27Wdn6wW67xdfBE3VyT0+70bolUe3qD72Dcx8uiXveKFzQyjNXTA
         MsTWU1AZMrXRlwfMQxn6JrO1qpD0q0GTXBSydxR1Xi1riztnywtzKRr7r29RP/QBrFTS
         TdoZ8wUAnYbrTvqGDVHxMycQaZjZaTov+RixHkc+MT3kl1cd7oPajP633fr2t1XgGN+D
         0pyA==
X-Forwarded-Encrypted: i=1; AKwUvBx5ZK75tlseWdtn/U2AtrB90qsQNnXOf2kkuI27pqx6lchx+h+Xk0eVhk3ZZt4iOZAJH73mvQYEWeU=@vger.kernel.org
X-Gm-Message-State: AFuF++m0UVjSrBtUuqljoLns+sRvk5b2fRPFcaZU0gILeBQn/z+B/dOl
	xPtdJHenN2P7lEYR7Tp/3wQojFttmoCzanxJf7W+5HFCtf3hJLn+LPccS1L26WNOZA==
X-Gm-Gg: AYBFou0w6s3MFmhT73B+giCygTBQSobjJCTQN0iL/xfV0hH1rz8nncFfimRqyzm21gH
	pNX1SWmdUw4rN5XSKROvhDI894EtlP5rQ6O5YLbTQOqn6EeylFhdsocA+7EEcSJ+P8tuW9NU9t3
	KmOxOflTa8GcBMgxlFZfVpHzCzUQvWx10ic5262jhHOtjwx2NDL40Is2+GCh18rgBhQOOrdyh20
	bLcYvzEvjrIXJqkpRFeyHAE5hUG+uyXz5YfjViYmytPyjZ1brWJecx6fGiN2vG4PhgAKVgx7ugz
	BBWtTRlNlRO7moKrpPCrUs4uJBJgP/J9x3aHVLqXwOdLSmLR5WmY8F6BLpEVjrqI9EFR3p4cKTG
	xERJECgr2y+dWrBZf87K2iTZurY41kWyIPkzhQLc2AB0YBaB7lyvqMUBHkkyrhWO4z9TwYphyo+
	OXODx0/3uknQ0U3JLLq1uK+svkxAzzdru5ri+HzJTiVNmONdQWM5Gl5egGAsXSonZxjAH1j9Kwt
	ss3fJPWcnUfDTFdG0KB+sWD4FYh8AVRe/DWUmuNRhn8
X-Received: by 2002:a17:90b:5343:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39b2628fc1amr8001002a91.23.1788511341225;
        Fri, 04 Sep 2026 01:42:21 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:20 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v8 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri,  4 Sep 2026 16:41:41 +0800
Message-ID: <20260904084158.1341550-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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

Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
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
index 68108805482d..fe7c403e3fa9 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1109,6 +1109,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
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
index 3dbbd01a52d0..691e792775d5 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -509,6 +509,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.979.g7e5102b832-goog

