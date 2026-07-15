Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EDC3D9538
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105719; cv=none; b=Tgk9NQqqah/GTym7xjPz1/3281UejvofJjQ8c6MBtcgTsNSgbarDrqtn0ipKHZMnIZRqpGPPgPcFJC/WgGnRluC25pvhEK2mEmHoZqZEXjzYSBOMG7lPkA/1PuBLmRrsGCuSUYRIkx/zVU1h9uioj7ts6BpmLpEuRVS+M8wQpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105719; c=relaxed/simple;
	bh=gDXGZ+qtSgJBs1RokahbHI9JUNzui3YVteN3ANdaDwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUwY2YdSw32/eIjjdf9lkD0LQ88PG8I3PiV9dUEL/epQvuWibeXnYJozXvPX5i19VePXUCuVOElbdg6cS7DzMafAXXgyQbXG8Kr/281g0QnGh2l2sJF4emPpJ00peL5Tg01UTfN5pvIyhn5PXZ8bdU/CW0tDs5W9slvab/dCKM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gPJdLGFW; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gPJdLGFW"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-848743155bcso787591b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105715; x=1784710515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=gPJdLGFWJPu2ncT7/v+qGEENyv+INhQHiPv30+8oFRe4ZhZwvfT17x6mf5srhvRY1h
         0DqNNIeyWvxN8I2h36QSj+Vh7MjpJFQBsdtR6qSS9eGhrahvhC4gMpYd6qDFeC9pmFa0
         SZn5tMfTJS8wd6zi59r47jW8IR+Vox1siunCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105715; x=1784710515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YVHm6p5wN5KSAyn8QSBlqPHJusamsYORhaWsm3vPLUI=;
        b=iVTqL+9y5aIMbcls6F9YCnd+7xrsKZa+5GpLSuPmyNNwheKlSVULgYsRFu0bAtyYvp
         PAzsJ6JjCAIzq0I9NrH/zcvcLl1WTbaEK3qsJldNTogPxY2Awe+yHpabcxl34KWR91FN
         ZzhYNBeb1eVG5tu+E3tbtUzB1foR6bKyKG1sj7c4L7zEcMbqKYQgSAbmlQ1aAL4kiRyN
         6NERmyutHmMZ1vpu2UMXIwWN7nJX8WL/klLGUtHEcNSphuWZkID9Uy14xNAiKDwjLLIK
         Gr7jQElXz/iE1DulHNeRENxO9M63gGhvkV4QKvOUtBK32LkQglECbTUmZQ44sw0dcf5N
         gfbg==
X-Forwarded-Encrypted: i=1; AHgh+RoYiGEgNZgEEzZ7zKm2ljveiF1r43WGQCITcvn+msRZSSO0ksj4BYanF1AycjHcGrdPyjChVJ00VrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbPcn8jrZ6XKUUiVpkVyH/n1Ep19horA8NBxp4OyPmrqGvzI5Q
	jxseUM0+t9D93FfWiBhiZJiBQf1VTYy7LWTFTXM7pa8B1bH0FPgLfZXoye8NtTCajA==
X-Gm-Gg: AfdE7clFzsGShQqDjK/PKLf8/dozZLqgauqfRcmkbhzvAPo7mO3bNoqmB6Th7t3Q2po
	vyCiNNepcltjeDYcnkqVAOhZPF1jBYYftGl0CRcxxsJF+7SVB3J7KYAe3z2X5G0/y/MzvmBWceX
	EXhtHshoCQ5DEAjVCabZRhHBn3MYAoVz9FI7Pio9+DPkPD1b5SeUop4aOyrmZC+4eR5rdjCLZSe
	QToRQQ6Y77x8dw2Mb+8gC5aTQ0+hGgof9CVDE9U3lc8vLw0Usw/11tkzFInAAd6mN/isZPZ1HGe
	PkHiZm1Lg9y1VLAsWpQqeDTO4xcjT2txWh4e+uXAuc8gG9KcBQRU+PTfbXwVyVMGj/RY/Jz/4zZ
	XVT9fWLAIZoVVqaboXfUaG+4wK/pfvSjWkn7Q24CVgWsfYJezuFgJyAOiv36x4Y8vBXmVOjZ4fK
	dscxfO4sEZhrZ5PPyo37ueAXIdfkfhZzZVIpnnHdm/qmj46QlSnlvCe79vRCKhM8bHDfxo5A==
X-Received: by 2002:a05:6a00:228e:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-8488960660emr14884802b3a.23.1784105714825;
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:14 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 15 Jul 2026 16:53:42 +0800
Message-ID: <20260715085348.3457359-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional (Andy)

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..691cad0a6dd0 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.795.g602f6c329a-goog

