Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6363B42F8
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080890; cv=none; b=UNA6rYa9zA4BwWaWfhCqKswbyWjFLoCnE0m37aC1OtMSAJetvPOlA4IZbJVW27uMVQU/5IEePRl2MMgYJSzMPTulqpFDOaIMKMRE0Rs2IU51NgbKAW0uAyZZOdpkWIjzrURMNV4zsXZM0opUANwpLv/PFeghMLLQxuAK0wQMQ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080890; c=relaxed/simple;
	bh=kGHE6+HJMR5imhLKMaKrAxWZPafgyUmm3WFusAEShNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mhPENNXuypjansd7zAuTMoeut/kBPrnz0S9xyV2PM1RzeWdrdbMYvPsAbSssq8wFnuj+tOCo6nR2s04KFNFnEV9DnqRkjcrXU0e2tl/W21nB2XfVHTibXzWisokvBdre1VXxtkztk2+Jr9L2Iq9eNFN9z3KLyNtlIm25+1ukcC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UeNZamHz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UeNZamHz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf114b0cf9so59287065ad.2
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080888; x=1781685688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=;
        b=UeNZamHzBpxIDD55A/EpwJn4VeIt196/YcqEaOqVYM09w3muTzoBxBOKqKvPp6POCC
         eNVk6BBUujs6WDSOg0wl1x19Pft9XwIwjGDZYxXqQhJaGS2hZnLtnhMnmXuQvCmj0G+R
         4LHFquxEOnD4063odNEqmxWl+8B3g3n3036cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080888; x=1781685688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6pTgkTdjphaP4G6StNKBNkGmsxmuRCJqaledSqIiFY=;
        b=ZSdYaCCa+pC2cYAX2jGdL1/HyteDy1osMKo1P8VOx+aKv52VLgS/YuiIANJfgu4MTK
         84LKxk71KUlu7F3soCP4YZE8FEvDrDmjimh89e2Jv8A+uCfAS5TgjvdZJLl4yMa3voGO
         Y3nA0KrlJXI29C6rwPMy3/J5AB3YXs731FOe+7Y196K2ueDZNpoMnlbUc31Q4g7dMhQ4
         A00NbI1Mc3X0bXA1vFNVu/M952/QV5TXZZjXYMvLwaXze+LLY9XoxjYC2zxYRUomOS0J
         5C5hPVjuEQbTzOrTQlfDy7yR9Jij5kKFBw/WwUQwTtosEOLInJHg9Z/lOboKFPV1yhlU
         l5YA==
X-Forwarded-Encrypted: i=1; AFNElJ9hhYUezzXvc8FlH+6knFFGChCs/rRWCASXBHpLF/tHHHVNJ6JKO+7PIpStUXI8M5RgQqpnSmrCcZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXmMwY5bCWXyS7ynv5kImYBCygCUykKl757q7SuzwESrfnWAy
	R6UO9mWqp3YEPqM7gVClVrhhNEzsuEoOmKx5qZYaJTDCCYgIJ7iT/68O7nhpNUeCDg==
X-Gm-Gg: Acq92OFUXknEdzbDR5MEal4uY7VBN9cp4cs9xOqhL/j7ZDG9YXBgn+rPzyMCv6Otl7k
	4XWezw5KgDpUoP/L8UFFTPTiAP73hqDKOFtyTYM1QRA+M035GsPQIt+G8v7L5FcJY/384BRZUdL
	ieW944M2QzpFcYcECkYriCTo3S3/TzCMDWU0oOLsISbuEZZ0ug+2Yn47TMb4yi1xAlI+YDVR4lp
	6apAYSyTTNmbMVHLu4vOZtOFIVTaR0qNhdqZBKjQlYrmZVhF/Vg41gUbFovlyawvGSooPLProTN
	lraGcsvcJxNSMX79CvMt2icj7fBQc2xX8KWLxvLLdZWL+OUu5YCjGFHywTgyK3E/fsLslq8qpwu
	BpQaMBRw0y6mgF6+dx6EoLUqboJ4vjPirORe/8iHx1GmlCc4v1vxU31HF416Xmwn1oB2LcIYRtV
	GPfdCLBeTRkNFjkajBfnAG9TuaOD6nKkRnctqJrSzYyu2RmVKrTQYjQd/mUHCxld3b83ydf6qhN
	v4aajE0NfWkq+enfw==
X-Received: by 2002:a17:902:ce8f:b0:2c0:cb0e:ac42 with SMTP id d9443c01a7336-2c1e80f9d2bmr271193835ad.3.1781080887890;
        Wed, 10 Jun 2026 01:41:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:27 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 10 Jun 2026 16:40:36 +0800
Message-ID: <20260610084053.2059858-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/base/property.c  | 33 +++++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index a2afd854a604..cf14f9b0a3e0 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,39 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
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
+	struct fwnode_handle *ep;
+
+	while (1) {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (!prev)
+			break;
+
+		if (WARN(!fwnode_name_eq(prev, "endpoint"),
+			 "non endpoint node is used (%pfw)", prev))
+			continue;
+
+		break;
+	}
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index 11f3b54c7de0..2e744c6f251d 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -500,6 +500,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.54.0.1099.g489fc7bff1-goog

