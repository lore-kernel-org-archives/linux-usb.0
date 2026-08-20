Received: from omta-ad1-fd2-2101-ap-sydney-1.aib29aea251.vm.email.ap-sydney-1.oci.oraclecloud.com (aib29aea251.vm.email.ap-sydney-1.oci.oraclecloud.com [192.29.151.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A9B3DDAEB
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 13:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.29.151.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230811; cv=none; b=VDsBDkTjFKKlQCil9n95sBycih1M+ZpYXKiCRcU/jFTpe7zAJSXVdIYpvaA+QrwRAQ6Od1ZDZsQtuiU52flDWHuGXRyFNBsOgqzLYBJU2GZny28fLVMJhy6j2n6AqJHtGbB15nNI7m/+GB8byDBzdp/vvVFN3AU+IipLLjLsH14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230811; c=relaxed/simple;
	bh=D0QbgrX1gECyUjynNdEd2tDWQSJA43aw23aB165qKlk=;
	h=From:Date:Subject:MIME-version:Content-type:Message-id:To:Cc; b=POO+MPTL4iu+CErhEX6cM/LnsLxRKlpg/q14lEICOei096E4TCP/l+nhRm6qcm1YiglKZeptyLGw80kEvP1s8mv9BVwmM3JXN0ppeAOWmCy2TeTpbPO+8GTd5TUlos7eOIh+HvrK0+u/ECzMWYJSY7M8TiWWaiRN2F6EZcLk4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b=L8K/4avF; dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b=bWroWEm5; arc=none smtp.client-ip=192.29.151.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b="L8K/4avF";
	dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b="bWroWEm5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-2026;
 d=stevetech.au;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=A464r00zPmcHfmDSNacqOPXrxV2So+q0+pCfkvO0IdM=;
 b=L8K/4avF2qG3jBc/j9ifiIBDOC7dBSH7am6HcPN+loqKfZM0yRBjVyOSkhmC9UH2UD95j21GPZF8
   tv+fXCUo4aXiv/8OLmkZvE+/A5S9WbXH5f6zZngsenOWKjxShVIJU8enz1nidSkgzCzOYtcCFlQt
   Uhzf6WWzRPXxQg906AMZLnCsk6ExXGXsIrwJQxuXenYlkPqvrbFFpTZrszPCKL/AZYKPUrdDiBjb
   rNZVuuiyTDv6SRcnGVPCRB5FdCk3v2Vnj139QX22Kn8FZaQjOt2etWX4efCfT6c8DjFh+1txXDPN
   RsxvfTnEO9NvediBJYCXzChRls0O4/fu+hKEIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-syd-20200122;
 d=syd1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=A464r00zPmcHfmDSNacqOPXrxV2So+q0+pCfkvO0IdM=;
 b=bWroWEm5ofBfcsXCQcMk/gmwmMgbOkr4vS8UuV621xb9yhHGElA8CWYCv93uNntgkubqkBSvzz67
   rEUdFl3/fJabEMNSTM3UwqPiO0Ki11P/p4kOyKgWPyK6x2VZnK0c2WrmaTK69DhQUxzZsImFJnA3
   HKumMCa/7FtX6ihyR3pGky0mPHsKIQvPOs7pCtUaWwf2Jm+K4OpWGpv2gLMOH3LDgvcVXvZQ3hrv
   SapHvdU00kN4dL5AUbaR70GocN3s2rZ+e5MSX72AeiOd+BmMffEua5TShndbS1SQH18NyQROpmU5
   PI493X1pqB0nrb2R7l2ev5oFQ0Cf6wSguOEtPw==
Received: by omta-ad1-fd2-2101-ap-sydney-1.mnat.vcndpsyd.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260722 64bit (built Jul 22
 2026))
 with ESMTPS id <0TK20PXB4K45V640@omta-ad1-fd2-2101-ap-sydney-1.mnat.vcndpsyd.oraclevcn.com> for
 linux-usb@vger.kernel.org; Thu, 20 Aug 2026 13:00:05 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Stephen Horvath <linux@stevetech.au>
Date: Thu, 20 Aug 2026 22:59:41 +1000
Subject: [PATCH v2] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset="utf-8"
Content-transfer-encoding: 7bit
Message-id: <20260820-xhci-pci-prom21-v2-1-638e5958fbbf@stevetech.au>
To: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Jihong Min <hurryman2212@gmail.com>, Stephen Horvath <linux@stevetech.au>
X-Mailer: b4 0.16.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2RLatNh48j8Mh1JWWRWWtEAwh
 H+X4tnDHF4y82aFiIEwwiVbIeBMkbjfQZ0y8K3rHyio2RlUocrCSiuW1pMYUgJ3SgqPdaFMo61
 2FvbVEPBOy2G8VT+OU/1EPyZNarQURw6f43KWqfffPkshRWmstuaMpdHNlafxzfzKPXe5m6Dat
 u0L4qT6usUAAAA=
X-Change-ID: 20260818-xhci-pci-prom21-ceb025d484a8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090; i=linux@stevetech.au;
 s=2026-05-03; h=from:subject:message-id;
 bh=D0QbgrX1gECyUjynNdEd2tDWQSJA43aw23aB165qKlk=;
 b=owGbwMvMwCW2fE02S+6FuT8YT6slMWS1/Qr9peb1XXC+QJ7xbt0U85DimPfn3+oxX3jv/sZ/j
 1qEZ2l0RykLgxgXg6yYIouSqe8cV60slVnTcptg5rAygQxh4OIUgIns+87I8DvGUtTJgnfCpoe/
 UoKP5oSXTm9W2JFkuatL+tF/xu7ZjQx/OG843Lt1iW1NcWj1Jh635jLbYre7u2t3azx8wrOr4OV
 SbgA=
X-Developer-Key: i=linux@stevetech.au; a=openpgp;
 fpr=22354D9C452A6A249A966D82A7AC6B046DD09DF8
Reporting-Meta:
 AAEq7BLfsowY5OgUNfoXcthAcVhslpJCYFetJFKjjjQBGAoLtPmh7qDo+aCACBu7
 OeJBsSJJPbrCZf/dNDkJlOcWNcU+O2NyujrhzZbUzdWk7mgDOKkT9WrQvV4r5wja
 TgF6fSc0gz5OeYHoZtZcFDVSS2TNR9sereiIYVrXWUjty1z8hv1wt6PB/1gAARD+
 hKgWN1Ouepqbtblgd5Tx+4owTmxxxZ6di9oHwf08L92j4tBtHTjL5UyCdhrsl/uM
 h6rxI8xG/CkEaw/bX+4U1RxhDy/61YS9O3TB5gsLCGge0vmnsCzGt6hPxJGOlyFt
 z8eLpNdRZD+PbxXo7GyEwfac5H92S/DLeqEtnK+Xa8dW/+F5fveC0999QqC2skkl
 ifJefzL2mus1V9Utago+vLyuBR6zdakLrOrTrq5vg4qRF69zdGzdOj+k0hTt

It seems the xhci-pci-prom21 module only has IDs for the 800 series
chipsets. However, the 600 series chipsets also have Promontory 21
chips, so we should add their IDs to the list as well.

I have tested this on my X670 board featuring DID `0x43f7`.

`1022:43f7` also appears on the PCI ID database
(https://pci-ids.ucw.cz/read/PC/1022/43f7).
Device IDs `0x43f9` (B665) & `0x43fa` (A620) were suggested by Shyam.

Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Jihong Min <hurryman2212@gmail.com>
Signed-off-by: Stephen Horvath <linux@stevetech.au>
---
Changes in v2:
- Added Device IDs `0x43f9` & `0x43fa`
- Link to v1: https://patch.msgid.link/20260818-xhci-pci-prom21-v1-1-6584857e654d@outlook.com.au
---
 drivers/usb/host/xhci-pci-prom21.c | 3 +++
 drivers/usb/host/xhci-pci.c        | 3 +++
 drivers/usb/host/xhci-pci.h        | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/usb/host/xhci-pci-prom21.c b/drivers/usb/host/xhci-pci-prom21.c
index 6486f4a09345..5f088a47d79f 100644
--- a/drivers/usb/host/xhci-pci-prom21.c
+++ b/drivers/usb/host/xhci-pci-prom21.c
@@ -111,6 +111,9 @@ static void prom21_xhci_remove(struct pci_dev *dev)
 }
 
 static const struct pci_device_id pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F9) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FA) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
 	{ /* end: all zeroes */ }
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..b407676808fc 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -701,6 +701,9 @@ static const struct pci_device_id pci_ids_renesas[] = {
 
 /* handled by xhci-pci-prom21 if enabled */
 static const struct pci_device_id pci_ids_prom21[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43F9) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FA) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD) },
 	{ /* end: all zeroes */ }
diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
index 11f435f94322..533efc7db801 100644
--- a/drivers/usb/host/xhci-pci.h
+++ b/drivers/usb/host/xhci-pci.h
@@ -4,6 +4,9 @@
 #ifndef XHCI_PCI_H
 #define XHCI_PCI_H
 
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7	0x43f7
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43F9	0x43f9
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FA	0x43fa
 #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC	0x43fc
 #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD	0x43fd
 

---
base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
change-id: 20260818-xhci-pci-prom21-ceb025d484a8

Best regards,
--  
Stephen Horvath <linux@stevetech.au>

