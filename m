Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com [74.125.226.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7F04D9577
	for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777986; cv=none; b=QLIUKAvxSW4N0GSfHmiIRiGGgVlTPEsB5FQWRdrk+WwTkWr46B0o6uUUOiQ9umH4vvX+wTyjCcZhK4X2hxNeVGJA4ivwulRxLEc+eE2ntc4G2WyjkGmLISFnPewqbtW2n6H1IwVxgkH5swyfoiPgNVJhv5ES6oEg1iRIKvG3DC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777986; c=relaxed/simple;
	bh=U1Hv6/gbhpsi4CJd465niF6KPgOjs6MWfvNINhsKhE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kxBTikqW1OryO4vA/osiOSiAYVo3ZvVdG0SiSJKS+fFOJ+rAw2+nQm4i/PS16dqlhr5hp86peFCUpjC0t3V9ivA/34r53ZuFmKXZJmFSUVOV1xi5/IBl1YTGgmvqslmxgEk9pdK/9D/39Ij+oLnu7CmVjrHB1xHUc8YlQOG8Of8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hc1hCklb; arc=none smtp.client-ip=74.125.226.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hc1hCklb"
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986e0b83340so3378889241.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Sep 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777973; x=1791382773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oDyoA6fPjL0gLEUmJ0mu/HGgXQ0U83ukGEwv6gW1b4E=;
        b=hc1hCklbNGbvVzTCNeHVUUS3MyKxCW5enS4lIjnTEGnbck1hDvRECF4oqYwwzIAuAd
         ro+V46ncL56YoRbs6XUvPSJsJlUwe74Kn/aMEbyvJd4T+8RFvCtmi0lKtmn9pmLj77FT
         e7X7mjuE37dgKfckbxbuy9eISFsTc6XNmReqeQjAbFW4O5p5IsxlskNrGsMBrOK3AUyy
         4gRLCnWcWdGju3sAHUVD1t4VsDiCyzB7TeU12rlhXCxUw26a0TsD1jHq+4hZN3z9NMd3
         ggQQkvYV18q639wncO64B6IOuopIp4s4Wu2rVFE+Zj2NAewnu32NYwltRVD8CN5+M/co
         GT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777973; x=1791382773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDyoA6fPjL0gLEUmJ0mu/HGgXQ0U83ukGEwv6gW1b4E=;
        b=Hvlw4TaF1gxw1WbDUPntBO0Po2rhtkQ59ByMlpEXtt0CZTv2OY1MyqAbocS/b+XXE8
         wZsk6xHFyAI91gCCLfIQTNIJzBz3KfMedRPnYsxkjI8ieVJdQGNL4u5YR5wEU423Fxcv
         d4lSdVvek1s5IUST6tc9luZ2ZdeWzQGYKoo3bMrIe+pcqyVjSk1u52oHsCoTayx3M/ez
         oZhp0YGBvakW9su1Por3xruRIm8RLwIcJnZhzofwBdTKZrZJWm64pkJyj5LEX8uBDPw5
         UpK0e7X1ZCNUkjGA9h/jI8HlzKpJ45CS/8g4C8dRH893Fg8C+sNY04lyhnmywgaCez1b
         xovw==
X-Forwarded-Encrypted: i=1; AKwUvByYAJMMvanPVzYMhLRMoaI6mbhscQCuxaXVaXhcOCgl7iZgijPqeRpFX7aYr/VLYHXIe3/hA4eZvhw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5uS8l7hUFJy3noGzt4c6+L9QmjtXylTwrqA31fEv7PulcU7gB
	bKmZe8CYqPlEk76yqNwMKUUrNLei/9+AkLEV1PXaTOneHKQ4NKP08JbU
X-Gm-Gg: AYBFou0X5oTDoHyQAxRJ8omx0Fqu0diK8ut2ESD4CPc4RPXvOM+OQi8EUNB3FX9mO3p
	mixN/v1kdgTU9shDRgA4/qznWF8z6IPBNFAOnRXsJF0kqNfwgQRL8teMnHJ6HVLdtH8BE00UNVT
	9W+79FbYRaZ6pMbHE1LMjWaa8SEKp6OjEs7hMxzMnFQA2qEtTy+a+tBToQx3nSdjos9IPdPn8Zl
	u4dtrR1wt+AmjMfhRrOehZDLJVUm7e04uGhRk8muVuXd+s0hKkoK3oDuBrmYj4B9YQ4+UXQHNQH
	1MpApKdJHp1TWTCOzsIFx47c7Wotgo16JzuKr+nqktn37YX+cl/IaglVXfv+xnY9YNa9tonAJho
	BP2HOkYm5RghD3j/lSsHlHgMPh/Nc0bevCcfm6n0ql3hyiMRBOnBl2JcA8/XvpFji5UoFh+VklV
	7k0p24eUntNue+1bFM5POeqVIpTcmGj2xslOzcFirbS0X4adwyB5blW3mQ/M6OQV4SO1XatxEjL
	Vxq88it
X-Received: by 2002:a05:6102:5cc5:b0:7bd:3530:d84b with SMTP id ada2fe7eead31-7be72eab133mr356318137.6.1790777973185;
        Wed, 30 Sep 2026 07:19:33 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988d909c4cbsm1793220241.1.2026.09.30.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:19:32 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Wed, 30 Sep 2026 11:19:13 -0300
Message-ID: <20260930141914.6678-3-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
References: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_save_state() reads the standard header into dev->saved_config_space
and marks it valid without checking that the device answered.  If the
device is not accessible, every read returns all ones, the previous
snapshot is overwritten, and pci_restore_state() writes the all-ones
values back once the device answers again.  On a bridge that sets every
writable bit of the Bridge Control register, Secondary Bus Reset
included, and sets the primary, secondary and subordinate bus numbers
to 0xff, which cuts off everything below it.

On a MacBookPro14,3 this happens to the upstream bridge of a
Thunderbolt controller that drops off the bus while the system is
suspending: after resume the bridge answers again, but with bus numbers
ff/ff/ff and Secondary Bus Reset asserted, and the xHCI controllers
behind it are removed.

Commit e18d1abc3bff ("PCI: Avoid saving config space state if
inaccessible") added pci_dev_config_accessible() and checks it before a
reset.  Check it in pci_save_state() itself, so that system suspend,
where the state is saved by pci_pm_suspend_noirq() or by a driver's
suspend_noirq callback, is covered as well.  pci_dev_config_accessible()
reads the Command and Status registers rather than the Vendor and Device
IDs, which always read as all ones on SR-IOV VFs.

Check again after reading, as the device may become inaccessible in the
meantime, and only then replace the previous snapshot of the header and
set state_saved.  The capabilities are saved straight into their own
buffers and are not covered by the second check, and both checks are
racy, as pci_dev_config_accessible() notes.

If the device is not accessible, return -EIO and leave state_saved as it
was.

Assisted-by: LLM
Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
v2:
- Use pci_dev_config_accessible() instead of reading the Vendor ID,
  which always reads as all ones on SR-IOV VFs: v1 refused to save the
  state of every VF.  In the v1 thread I said I would use
  pci_device_is_present(), but for a VF that checks the PF and cannot
  tell whether the VF itself answers.
- Do the second check after saving the capabilities, and set
  state_saved only if both checks pass.
- The bus numbers are set to 0xff, not cleared.

 drivers/pci/pci.c |   53 +++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be..94de99d31 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1776,31 +1776,52 @@ static void pci_restore_pcix_state(struct pci_dev *dev)
  * pci_save_state - save the PCI configuration space of a device before
  *		    suspending
  * @dev: PCI device that we're dealing with
+ *
+ * If the config space of @dev is not accessible, nothing is saved and the
+ * previous snapshot of the standard header is kept, as writing back the
+ * all-ones values read from such a device would corrupt it once it is
+ * accessible again.
+ *
+ * Return: 0 on success, -EIO if @dev is not accessible, or another
+ * negative errno if a capability could not be saved.
  */
 int pci_save_state(struct pci_dev *dev)
 {
-	int i;
+	u32 config[16];
+	int i, ret;
+
+	if (!pci_dev_config_accessible(dev, "save state"))
+		return -EIO;
+
 	/* XXX: 100% dword access ok here? */
 	for (i = 0; i < 16; i++) {
-		pci_read_config_dword(dev, i * 4, &dev->saved_config_space[i]);
-		pci_dbg(dev, "save config %#04x: %#010x\n",
-			i * 4, dev->saved_config_space[i]);
+		pci_read_config_dword(dev, i * 4, &config[i]);
+		pci_dbg(dev, "save config %#04x: %#010x\n", i * 4, config[i]);
 	}
-	dev->state_saved = true;
 
-	i = pci_save_pcie_state(dev);
-	if (i != 0)
-		return i;
+	ret = pci_save_pcie_state(dev);
+	if (!ret)
+		ret = pci_save_pcix_state(dev);
+	if (!ret) {
+		pci_save_dpc_state(dev);
+		pci_save_aer_state(dev);
+		pci_save_ptm_state(dev);
+		pci_save_tph_state(dev);
+		ret = pci_save_vc_state(dev);
+	}
+
+	/*
+	 * The device may have become inaccessible while it was being read.
+	 * Keep the previous header snapshot in that case.  The capabilities
+	 * are saved directly into their buffers, so they are not protected.
+	 */
+	if (!pci_dev_config_accessible(dev, "save state"))
+		return -EIO;
 
-	i = pci_save_pcix_state(dev);
-	if (i != 0)
-		return i;
+	memcpy(dev->saved_config_space, config, sizeof(config));
+	dev->state_saved = true;
 
-	pci_save_dpc_state(dev);
-	pci_save_aer_state(dev);
-	pci_save_ptm_state(dev);
-	pci_save_tph_state(dev);
-	return pci_save_vc_state(dev);
+	return ret;
 }
 EXPORT_SYMBOL(pci_save_state);
 
