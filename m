Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A63B27DF
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080902; cv=none; b=qFTYadqFCl6PAtMzBNDVXBmO/0EN0/ih6mcdfPaPoplvkIkZbAKRhlvNo9tNNzRWxrEusr7VncMpr22W93+WOwj3s6aeTsAq9HfgKzPV7xr3u+ghkP24z1ysxqSvBQoLFQ6P1p+dyxKTV3dfWdKNMaDAb3A1/HQVgz+dCWLxXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080902; c=relaxed/simple;
	bh=R0+Z0BHMYu5U4Yu7kD4UWXq+2W/gGTv98A8HYveuJQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fKZ57LwSroUadJ1mG+woeI+PNLF0aFz5jzicF6rdTmDTxYBbTNn8Q9BZDEpZ1jq27xoTzF2U3z+51NSA40qKv2TLwHc+OUjr1+tCsTxZjlpq2zbpUj2pHX/QVYM3CwVqSfkSb42gKLkSIER1OIR+OGELZR4fHsWNxOZl4AKmXzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JdLVyMAl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JdLVyMAl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso62698815ad.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080901; x=1781685701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=JdLVyMAlePWYtAxi75yrYHjcBr7CvOeRurE6HQUnMcRhS8UHz39OpP7Y1/KqNYZ0eg
         RtsVZhfCveetdt872SVd/CBQpeKjt3/3R8w3aH/P9iORfAKXhu1I8J7GdMk14LJBRPn6
         eZL469YAH3n7fwc4egkD0faL7QMz+9tawR0eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080901; x=1781685701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=BqU4YOu+usckKg5Zy9g0e3IaMCPGhgnY5xTq1JmRYoy1DCxM4w1Y88zY7yD2v2qjU4
         yfT0bNT7ly5S9kaZhOAtIuBcZPqXoViU7/Yma7CdUHh1BzUZPoPoQJpl6EpAITkirqGt
         XvbeBaG71M4FBi375Mce9M+UoqgML9jrNGRYHxuPGVhZRhKVtaDwzPIfglv2Z/1s32A0
         6lq4Wz53upos++T0heVJaR1uGbERFzBBTRac84rbCIv9xval8N3xoAAsw1T7QyhrqXnj
         68N0rrKu8z5kIIpl7XlsjW4SQqWtKR9fYkKkWQl5bS93ghGcrD/SRvGdl8qUcYQZtcuP
         5vyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0DJ1ZMjKA+0bbcatWZAgv+fVhaEAjAXOz3XHda9/EeVPyqg57AXtvPS3kGUwa5JLLoUFfS7kIcWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdafiVXo+9Pv92kfYKuICgUXq4etz4gDLOx3REqj/qC7nbgvwh
	QzysznLtZDCddQClJX4nfO+6w3pXbUhSCje0xjm69SZ4wpUzhJIwbZl/KgNuNcMqTg==
X-Gm-Gg: Acq92OEGDRBhAb9UVgjqcUZ6VTfK1xSgGPRhe3xdo06HRV7ApjGVr4HdAhnhZbpDfa3
	uyZddFSWbsieutg17Oai00q0N62roPD7SPD0bymtmJF4khmR/P9aB4a7LCP2mPe4OfZJByh54O5
	tMEZQDfWG0583LQd0rY6EMXUiWT7Ac6t/OILd8r139O6qxymyaPJfveBtgKILVPYyIWPHFiGWhc
	d/emmhrR8qQ2/QqMigrF/xqPrvUYfaWfwiCUr/Y0uihfjrKJrAS6xffMDQ6qXxCbxxQIfvcm3ok
	HrwUADiMivs6IMti9m4GNm6OQTghHf2l4cHf4bxDOZgJ3k9M2vYE/mBWGz0eT1+1hW4Eoq0z+Yt
	st9oj4vF7zHgNSBy5FrlJ1n9+j0eDuzn7OMe0nreA1qKdkkMc2iTc1GfWp9MP2lSMnepKpy/zhT
	ZUUXQ/nCyQLvkiKimTMrK/IKTizrzwM7eub/WwPW1kUd5D5SvGDakUAoBqZGzmJYP8iizLAPcaA
	lo44jL0MorGPtjTyg==
X-Received: by 2002:a17:903:46cf:b0:2c0:d91d:c3e8 with SMTP id d9443c01a7336-2c1e80cd78emr274569985ad.4.1781080901116;
        Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:40 -0700 (PDT)
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
Subject: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 10 Jun 2026 16:40:39 +0800
Message-ID: <20260610084053.2059858-6-wenst@chromium.org>
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

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1846eb1206a4 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -780,6 +780,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	device_set_node(&port_dev->dev,
+			fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.54.0.1099.g489fc7bff1-goog

