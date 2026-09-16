Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C5745D5FA
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545527; cv=none; b=HA3RlMUgcByajh6rUk+fBWLiQm4t5IDbvTOytKHjw78luCwWhShrPph066b4aFGN/MtfUx5IkoU+gyILUKAfZrrDmgf+n9168J+GP+OI/Q+cdW9JjRZiNRDfgoOC+n7FtsCb84VAbIzfL0LJTCjfnua+iZ/oHDJW9a0ISPL75rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545527; c=relaxed/simple;
	bh=Ri/id/vx/k24FmJGCtv/k72ESmrqaseCj8QxRw0wDxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSnUqmF+n24tubSPQqVNeSc6fRTmtIBBcfan1MWp3Gpbee/68U6oFYRxqBqc4h3hIIAFXllFRbot7fnzdqxhrW2fd39sjYPUiaZTAEEfzQWXbBnSLB96VjuxCujW1OSMCP4rP5YwOl/q4N0xI9Q/qUTMpTD+5AIMDUOLRmaYa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZxN0Ive2; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZxN0Ive2"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so550172a12.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 00:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545512; x=1790150312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=ZxN0Ive2ziowZ2fetadPk6xgyrDFrxJ1F3K0uMtr5XfXrbw22j2wt0vltvFJFjbQyE
         kctkBHAQL6lYHmqpf7rKzMQkQdgWhDXmkVU7TvmGLdwuTUb9HiQAWwHLS579S4oZ+UMI
         faXVmEDSdZwefUq54cBjx8Nfh2rZfPlnhHDdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545512; x=1790150312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=DMInc87u17oB0PcRfL0G/moICftHZBpkI0SaUC+MsyjIwGoWf6PCs8VTloxaX04+Eq
         jDRrscpKT2WyamqQPCQAhHRyISvduNiXlg7/hafjBdpwp8/RUHIRg2VEWXS2/eH8LqsM
         7ACPVUXUtUdGQ++GcGV0WzJ+9XC53NBVGqmUPocl1zKA3972uupASjMuWW2wo4/tdf5w
         c5xeMl8vrBNw92Ywp+sphvKV/ybB17siiN1NaiJcLmyaVHDxIsRu6mVetg1N7neGo8/F
         s3BIMpnxR/rTB2Kh0sVKcZHJcEYXutVJTcJYEMLw6imL3ZE8eN9rFXYTULzxdyllx7+h
         /M1A==
X-Forwarded-Encrypted: i=1; AKwUvBy+I30K0PL4NyCvFlRGJvGPJPGkCYVVXSCPWnjv1v6q6v6FoL3NTw7R+5R2wecnIEalhZaOZv+b1vs=@vger.kernel.org
X-Gm-Message-State: AFuF++kNj0gckiNVTlh7Kkq5IpDVCzPv760JtWS3yoLyAvqRlkI1uKvt
	6YH6RUGePpLDDoSXiam3Z30Ag/4vehTIv8Wx2uKZ9RbAl8M8O5vqjE2OTYI2uOQutA==
X-Gm-Gg: AYBFou1SfFqxdWhXMD9DKZs9vGTajBdL979/nv31ck7eDaVAzmz1e7f1gkzbjSwj/be
	TJDgHT+fckxDKNp7tlpJtRyf811FOmOLWRFVBkKuGFbw7M9udmlME6Bvi1qxLEXnoF5rebqrOxf
	AaQFBBnS5dBzBPnICZ1IOlroD9MPafI+LMzIxMcUEZenLGRc650XBIaksxlaAkIGfsmPmUfB6Uc
	SxTuSbIUVoYqQ4USxLRJ1jk0R0r2iG2V3JLtm5yjn8tkHbxqBwyBgt7AvuUSgDDCS8j8zwKgEn2
	OTF9Fb5ICBUKesH576/Ed3/zLMC7dNRqC5cRpsFO6QTU2oTyeED0UrOQapuEu+xklNCzeRJG13a
	VpjyMyKs77u5zwn/X/tH/m0asEV78qwU4CkO17calF7FM2x39AXMcv/2ui2XUt5zgAQ2ckdcGqS
	fqFpBSQ3wVz7lmTmeHqTHjPhyNyRMDj6vs5Es8loDzwuhuewcCMDG2ZC+fIXyVJFqJPrv20GZ5p
	fSML+2FhJwkGCvd9cX0f9ruKhvAO1Vm2po/uU+QbyBjQIbP9XHMFp7lFg==
X-Received: by 2002:a17:90b:4b83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39e1e4c4687mr4082007a91.18.1789545512315;
        Wed, 16 Sep 2026 00:58:32 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:31 -0700 (PDT)
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
Subject: [PATCH v9 02/15] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 16 Sep 2026 15:57:28 +0800
Message-ID: <20260916075745.3549953-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Changes since v8:
- Moved Sashiko related comment to footnote (Sakari)
- Collected Reviewed-by from Sakari

Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c2b7a571fe03..924d03df4995 100644
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
2.55.0.1032.g73a4cd73de-goog

