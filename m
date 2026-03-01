Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557E2F7ADE;
	Sun,  1 Mar 2026 01:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330015; cv=none; b=LaeGZndfhmfC+i+Pa9VUi1RR41WJ+oK7Y6xI4wEKDPScSvVyUXj1L3+pUyHmqYzSLUkFyHVaV8ram9YvdMatjwK+xBs12P5KDHqyiN8Q/pPkciU8ZePcVide83veC7ejCurUadZ9iyPBK8J3s5q8U6HEYOVlK3qF8aZ+DiqfyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330015; c=relaxed/simple;
	bh=AlZrv7sCy++/PhdwqlxVM0z48AnPEsQLU7ReyLNgQYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SApX1eoro4O/44jYFVv2h5P3V53q1viIoYMK0JTJkOmFNKBOL+RTfaJtVK2lfzIVj7CvB5QzmYhtyigMQOoY3Vt80zOcb9ON6iTV7gzUwY7j8l8G2hjAWEhHdrjbpt55WxAYCHDG7y6csnbP0ZlCWEecdjQm4I2bgDIaqXpDW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObgML2zg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObgML2zg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D725FC2BC86;
	Sun,  1 Mar 2026 01:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330015;
	bh=AlZrv7sCy++/PhdwqlxVM0z48AnPEsQLU7ReyLNgQYg=;
	h=From:To:Cc:Subject:Date:From;
	b=ObgML2zgjUj8KLPzIycZwvw4X2xitoeo6tlC/dIdvsL9MsxWhnHfqk8AlpOMy5enO
	 4BYWUL2EnDBtlqiBmbG9VKnBHvTQUd4A6mdWZq2PGyP9lIru9g3Dabh5LFa3YkxPVL
	 FLaQxe4y66QOeyb/Cb71wY8JWtvhBG7lccLNcbEMfTmecBkfhD3JEq38eagYrSfhHT
	 yjvpcKiDpOCxPhT9qsyoxSKi1NKb7w+hy+CIw+4qAqaTZQn54fQaqwvpmCUMazOZ02
	 b3yVTvqbPOd4pulC1KORxBfyv6YgpenOO3oautjUocU9lKmh8SYkin+gLU0vphoS9V
	 W0KaZxQIx6asw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	jszhang@kernel.org
Cc: stable <stable@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: FAILED: Patch "usb: dwc2: fix resume failure if dr_mode is host" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:53:33 -0500
Message-ID: <20260301015333.1720366-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a52e4f2dff413b58c7200e89bb6540bd995e1269 Mon Sep 17 00:00:00 2001
From: Jisheng Zhang <jszhang@kernel.org>
Date: Thu, 29 Jan 2026 10:15:34 +0800
Subject: [PATCH] usb: dwc2: fix resume failure if dr_mode is host

commit 13b1f8e25bfd1 ("usb: dwc2: Force mode optimizations") removed the
dwc2_force_mode(hsotg, true) in dwc2_force_dr_mode() if dr_mode is host.

But this brings a bug: the controller fails to resume back as host,
further debugging shows that the controller is resumed as peripheral.
The reason is dwc2_force_dr_mode() missed the host mode forcing, and
when resuming from s2ram, GINTSTS is 0 by default, dwc2_is_device_mode
in dwc2_resume() misreads this as the controller is in peripheral mode.

Fix the resume failure by adding back the dwc2_force_mode(hsotg, true).

Then an obvious question is: why this bug hasn't been observed and fixed
for about six years? There are two resons: most dwc2 platforms set the
dr_mode as otg; Some platforms don't have suspend & resume support yet.

Fixes: 13b1f8e25bfd1 ("usb: dwc2: Force mode optimizations")
Cc: stable <stable@kernel.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Link: https://patch.msgid.link/20260129021534.10411-1-jszhang@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/dwc2/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index c3d24312db0fe..f375c5185bfe2 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -578,6 +578,7 @@ void dwc2_force_dr_mode(struct dwc2_hsotg *hsotg)
 {
 	switch (hsotg->dr_mode) {
 	case USB_DR_MODE_HOST:
+		dwc2_force_mode(hsotg, true);
 		/*
 		 * NOTE: This is required for some rockchip soc based
 		 * platforms on their host-only dwc2.
-- 
2.51.0




