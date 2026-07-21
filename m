Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE64343F9
	for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2026 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616934; cv=none; b=UByJNVE88WN+N7sj0vgQsjkTp0QDLQDRspJ0F0fWqrLeljbTSkwr0G3FPLuiWDn18PrgLDPPyN+qEE9esasqhVEn9/tzBO6EQU2Uk7NljyBzGqxpVYdYOtYwpxbZUAzDlomsivk4oI12v2a8HIco55nxPoCpX0hrXt8Chqbw0/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616934; c=relaxed/simple;
	bh=TPxqymmswATTFY0Ts3z5ZJsgeicU9hkYXr5TZUF7F/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJZoWuPwo4eCmM1aBoRe7H5Spjz9Ysot1TiAbAC9VlEc2ieeaGaMc2UzKKUVKFE9UjQY9E6RxKZIpkVLiVJttPG44fDO18dIg4HmhpeNQFGDmAjer3xy1uQ62MaJeEfiyqynV/Nu8Oc9apv2R3KGGM0IzIbddllqwzj/wdN4hnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HnrE0Bfk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HnrE0Bfk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf52d15d88so25295215ad.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616932; x=1785221732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=HnrE0BfkJcQENp+fx6WYE1H9Xyzox5+4j72mtBwMiaYOcnFTM3sELlbFIabUtbj/Uf
         Z5KtAc5aXXtFdTn3pIAfgdjjUrbGm82eZ9JFz5lAP9wXJlCTnINVXZDx4eznn7uhUugw
         daqI5tczffyFEOFQTjOYT+Mq+KQT0rTCRx908=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616932; x=1785221732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=VU21SnAZVo+LX0z+K7ogb0nuixVbiP9llFUWBP1DUZRWvNM0ZDLRDD+MpkL8A7DA8o
         LJl3V40apLu1Ta1Hb0joPkWfM3sB5dzcJmNiB1LRYt0fsovrhorYX4SCepxb28nljnvs
         PcUwCw90mq71e6t+vKFmbVWnZik17nPSk37goT3wHvzE/RSTzKX61xlxWOmXKja8scbP
         F9ExTRXSznzgn9/cV4c1qie3sVaBdX7KIbx1TAWS8h6tj3rZeC3LfB15dLg8Qwrm0day
         CJ7q701hNgCD3CONRnBa56au22YKlfSEgJyYhVYTdzIquC6voPUx7vQ/mZmJshBQa0el
         yoXA==
X-Forwarded-Encrypted: i=1; AHgh+RqT2I3koNKUk480gnUYngE93rRwlLDsycttdaoWFNb8gZvlU8t0qjccCpGDxhVujy3vLQoyoYkb5Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+m8PHp9To+JnAo0820vkSeurK7xvwIHTRlAHPRo0ouvncLSxL
	fPcdxKa34eV+ZPYLbcjvtl1fmkLkrDlrKWsQS0TYvrGMwjRXv5gZSCTx45hAw3dlWqvBMCx28ZK
	S4Ac=
X-Gm-Gg: AR+sD134pclSDuZXnqK5RXKRiLu1wijjIPS5dlV8XFd9Fqpe8PL93eCCBJY/TzgVOdG
	ogeQXhUV6GBJtMnLz2c4obUWQVQtN8xndLeBg42DSaZrSXdsdi+eugJqt+rRnm9W9s0NDUh8NPn
	R05lhK07t1NRWDL5BiZ8iECxUn2JJBX8DKoXHyhCBj2aBWeZvb/vCVXXiUpbbvROmpV4bhABj9A
	0vHOOmBaguMT0ZdtDl2L5EYutAupfEQX5/00sAuFJ70Qtg/TIF8D+PbpRzci631N4/wWqNyd7Xp
	w5+SC+U7G1PXLwsj9AQ4aJf3AEjPx1L1YIiXy8f+jU/4OWGjzAwP7z/H9n0OI39lqTyvOlKkeD2
	48fns9vKqln/2fqAA8Y9VZSo4l8QXgtgKE8Zg6tSWpR+gFnW3V1jE4dVkkg/gU4YPLY1gLK5Xm3
	d3UhaZjGk2rHZb0NrQ8FjvZcht+5PG0kUoRdVBdiJ4Xwa0RG4wNQuqZuNHH/I=
X-Received: by 2002:a17:903:2287:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2cf348366bfmr176522085ad.3.1784616932321;
        Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:31 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v6 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Tue, 21 Jul 2026 14:54:07 +0800
Message-ID: <20260721065413.2306137-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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
  subsequent use of the variable in conditional

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
2.55.0.229.g6434b31f56-goog

