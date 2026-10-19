Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441519;
	b=kHH+xWpml15pZm4NOlfrZPMVAmkwSsOqRUobknT5USMg6sVjmbyXkx+34YGuEg62daWz
	 LC8iZiFHDixnQjiLsZA3TntFy8lw16/sVFm/ca2YAvkd8KXoyXKnI6hU8/O1Hxxex87SR
	 7ZHVLCoUS366JjLxoGaPdHmk81Q1gesAvEfTHt78kXYpgMMStOR7cW5bT7DH0c5Yva66x
	 dVainxqNWYRl3/wH/8Ci/JnpWXAjyB+IsSjhLjetwQqU6Azi4+qORvJtGDVR2ld74t5pC
	 BQ7vzOfVWp4Ng33jTcz52d837xpaBi0Jo/Fkdl6ZXqUeDzBFqehh1iKZh1YiKmUNqtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4q9LZR8lO5Ut3wMXLJYCt156smic9s4b9LeYVAkPcUw=;
	b=XciPKiDbSbm1V/Ks0o0+1unUXKxQd3rd6mwZSuLoG618SrMZqOD9ushenqkWQuz9qL8R
	 cnA72S/5LZasnTYs27HdbCenOLL8Rnoel/jL/My/dHAzklRe8r7uMwjvNdmEsvT2g1poQ
	 OrmyfgVQV/MzV3fog7+brOGkyfs560nlhzMSYb+vn/w8s3OhFTthEqsJFsdtW9CRIn0m2
	 h06gmHl4H3S6M5qJfkVocGXK8UVLd0n6dNkRPGHXEIcM8CpUoS1lltgpEF9MFrb/GD45t
	 5ErEXB4cVI40GIL2frQSsk290UcPXm57yGhK7wKFrkkrqzVGph2MEnRCQEPXUsh8Mng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b3n3iESw;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D018D606A322
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 20:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D018D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b3n3iESw
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eaaa9b1591so1468904e0c.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 13:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441518; x=1793046318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4q9LZR8lO5Ut3wMXLJYCt156smic9s4b9LeYVAkPcUw=;
        b=b3n3iESwm43cGITB3Nstp67NHJ9NaTjO8YW6SzFN0R8RveeAZUxnbsu+4Ef/Yhe8AO
         33evcLFrWK+B8KyjJKEmJjStJ/bZyJgtZtA2T0PqY6W3za0WygokmuekeVF+Z+DLHfH2
         WKhuUF6W/vwLY0XegluMV/fhj8GXFSAOQ5f1Eu8vHmsuZ5oSpG0SGNbWFHYj6jnCdzX5
         ROT3sXIxosF1+cjjbog8StFejCo9gi+gX2Yx/llkyAzTBdTMpYwHx03axYPQb9d0/+vh
         /srxTzpK1bl19mWL8u/GwvoMBQreIJLXkEnnTGlJqBCUh64sdJIzaY56Hqn/MUsNd/Sw
         V6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441518; x=1793046318;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q9LZR8lO5Ut3wMXLJYCt156smic9s4b9LeYVAkPcUw=;
        b=PWzxBT+UbtIGy05eaXOqVJ+/Aw6uSRb0dumQD7GJt+qvDIie/ZTidi/F5JaFtfLAT7
         E6tyhX5PeDH+wrmQum6CFt4ouPyfWuicUxhtIvxMR6oTGL9Na2NX7yim0FU1+APi86lB
         TICgkrZmASZ7XJzh9IRG4mtxcMKBTYtgMYZBH0tU/tINm9jYmjbEMmJ6Vyo8dDNvILfK
         eGEURK4yfdfXS8t59MmqQ0U1IvMRVbxa3grF4RNBFc/B7pUes6Cy4Ozwp7plVTzudkyH
         1WXImcydBja7oX/4qanQjuKzVX04zBTcEqQfdrShJ6moU7y7TczDS7LI7eZOlW6S5ufk
         rrdA==
X-Forwarded-Encrypted: i=1; AKwUvBxK4/ZhutSSAlFwlxdinTBD8dUbd6y8pRRVwvPqudYH9/afxRLlQUkp9WTZ6BDezEvr7oLMADDUENI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwI6EDK+y0XdOkPT+ugU7LoXQZ9+xyEa5l82slVE7KfMNaeopy
	SOR3bJ1eS/f1p9oQbBwEe2VLPIo1hsVtEgtnEV5+UxT389YfWxY29LwL
X-Gm-Gg: AYBFou2FFj8hyAsi/QpH/Zdm18Tl+ZoEyNI4bRFOsFgCpDa9tyIZtXsNhm+i4a4HCIx
	eDq6UHNRJIo6qBTwsVSO2vMVr9C/eYb4sfFl+L5wKcV2uEo/D+Xen3XiY6c/IDIa/gDMBhwNuYP
	us8Az2sA07RYDUimMv1saWYBLpzHnt6fYOaS4ci1BOIBsA080UovqpWeYq6G3ifuA0S4ss3yfP4
	zqvVZw8/A2LzkLwiizBUslZXsk5HucVN2Bxlq9q0lDsv5e9ErzRPImnwyC8hbYxb4bYnA1B5lMy
	Un9KKekuS8MmLfOLUenKL1Ifo3sxrjRa5XL8tGsJqsDTasESE0HzTr/7HgFj52VBshT+YIrDsxg
	0lT90uYHCzBqira/vKQ+VzSCsBrhiMtGvlHoNqYUSm1WcAfCzEgsjgly/8iFBSPZ8UkmBSIqtTi
	9khATrcbbjOhVcTQD3DqtVYyOaMH88ri9iIJ5Ior85WvzhLnrOCQboksAhQcO6KEeyeG7MfhwSO
	APnrzMg
X-Received: by 2002:a05:6122:32d4:b0:5e9:176f:a548 with SMTP id 71dfb90a1353d-5eaa9eb7e68mr3507437e0c.0.1792441517762;
        Mon, 19 Oct 2026 13:25:17 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:1c75:eeaa:b22f:20dc])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b128725sm11194050e0c.0.2026.10.19.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:25:17 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	Farhan Ali <alifm@linux.ibm.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Darrell Gum <d@rrell.co>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] PCI: Do not mistake an absent device for an active link
Date: Mon, 19 Oct 2026 17:24:45 -0300
Message-ID: <20261019202445.38259-3-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019202445.38259-1-fbeltranmillalen@gmail.com>
References: <20261019202445.38259-1-fbeltranmillalen@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When an inaccessible bridge's Link Status register reads as 0xffff,
both PCI_EXP_LNKSTA_DLLLA and PCI_EXP_LNKSTA_LT appear set.  The link
wait code then takes the inaccessible bridge for an active link:

  - pci_bridge_wait_for_secondary_bus(), for ports up to 5 GT/s, decides
    that the link is up and waits PCIE_RESET_READY_POLL_MS for the device
    below it;

  - pcie_wait_for_link_status(), used for faster ports and by
    pcie_retrain_link(), reports success at once when waiting for an
    active link, and times out after PCIE_LINK_RETRAIN_TIMEOUT_MS when
    waiting for LT to clear.

Treat an all-ones read as the device being gone.  All callers of
pcie_wait_for_link_status() and pcie_retrain_link() treat any non-zero
return as failure.

On a MacBookPro14,3 whose Thunderbolt controller does not come back from
S3, the downstream ports of the controller are 2.5 GT/s ports that no
longer answer.  Resume spent about 65 seconds waiting for the xHCI
controller behind one of them ("not ready 65535ms after resume"); with
the pci_bridge_wait_for_secondary_bus() change it gives up on that
controller after about one second.  That machine never reaches
pcie_wait_for_link_status() in this situation, so that part has not been
tested.

Assisted-by: LLM
Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
Tested-by: Darrell Gum <d@rrell.co>
---
v3:
- No change, apart from adding Darrell's Tested-by from v2 (was 3/3).

v2:
- Also cover pcie_wait_for_link_status().

 drivers/pci/pci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index eacaa1e71a83..24b51dd0f9cc 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4604,8 +4604,8 @@ static int pci_pm_reset(struct pci_dev *dev, bool probe)
  * @use_lt: Use the LT bit if TRUE, or the DLLLA bit if FALSE.
  * @active: Waiting for active or inactive?
  *
- * Return 0 if successful, or -ETIMEDOUT if status has not changed within
- * PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if @pdev is not accessible, or -ETIMEDOUT
+ * if status has not changed within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
  */
 static int pcie_wait_for_link_status(struct pci_dev *pdev,
 				     bool use_lt, bool active)
@@ -4620,6 +4620,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
 	end_jiffies = jiffies + msecs_to_jiffies(PCIE_LINK_RETRAIN_TIMEOUT_MS);
 	do {
 		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
+		/* All ones means @pdev is gone; it would look like an active link */
+		if (PCI_POSSIBLE_ERROR(lnksta))
+			return -ENODEV;
 		if ((lnksta & lnksta_mask) == lnksta_match)
 			return 0;
 		msleep(1);
@@ -4642,8 +4645,9 @@ static int pcie_wait_for_link_status(struct pci_dev *pdev,
  * according to @use_lt.  It is not verified whether the use of the DLLLA
  * bit is valid.
  *
- * Return 0 if successful, or -ETIMEDOUT if training has not completed
- * within PCIE_LINK_RETRAIN_TIMEOUT_MS milliseconds.
+ * Return 0 if successful, -ENODEV if @pdev is not accessible, or -ETIMEDOUT
+ * if training has not completed within PCIE_LINK_RETRAIN_TIMEOUT_MS
+ * milliseconds.
  */
 int pcie_retrain_link(struct pci_dev *pdev, bool use_lt)
 {
@@ -4876,8 +4880,10 @@ int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type)
 		if (!dev->link_active_reporting)
 			return -ENOTTY;
 
+		/* All ones means @dev is gone; it would look like an active link */
 		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &status);
-		if (!(status & PCI_EXP_LNKSTA_DLLLA))
+		if (PCI_POSSIBLE_ERROR(status) ||
+		    !(status & PCI_EXP_LNKSTA_DLLLA))
 			return -ENOTTY;
 
 		return pci_dev_wait(child, reset_type,
