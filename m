Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.222.135.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795276435;
	b=J0IWf+vwVGWWrV3fhfACz4vK3CsluJTVEuc77xy8BqKG26jPkzNv6uUAqAfv5Ce+TXb1
	 D68GoGcUBAjn84GYgHRIr/qO20RmihuWzN5lCk/7p/IyCYw9kDmvuIgHiMS3seFAwCGO4
	 3APN70wJXAvrr3D4Ys++wOj1v+pICFqmhtEtfW6gHrgPr8GZp98KQFnsft9Uj54TDVNo5
	 jPKs226EsHTl5GdkK5Hoa8T3dI6JinvpcF5Wc3OnGCUtF1V2NvsadkoI+zirIiy+Tj4hT
	 OKYL8UAh7cbTsegdDdm6erssIk980sim3RToTTGnbgXBRhrFftO5KgTtjlQWdOLnkRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795276435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-WP-DKIM-Status:X-WP-MailID:
	 X-WP-AV:X-WP-SPAM;
	bh=7bBGkEM1F0aiz0suHMTa/EpEpYTAohLosYW6UGvonyY=;
	b=mS9kQnJvE6EBK5hIAMorCtV8GU5muBss47qcvkQvkWdMIdhd5G7FWEClZG2A13PIsAZh
	 E5n+u5b0gMj/KIiEQeyQvZ8lHDL2x/4trS4n+EQTQGxxEx85v+ji1BCG688NgzuZBqOXs
	 UO/q3eN9/aC5BE16+D8QIRlO8+dE2TUdV+iIHnyT5Ey45q10VSP8MgdHpwsPFldKisDZq
	 OE1LM5T9Pmv9SydLg3d/HiMn43fh5r1eseh0rvh9U5Gy/pYu7CbEzeG8o/OG3JUKjm9RW
	 1ofo0eCCMGSEzxJYKrKWY3GVO8wpApHdMv9Od+4na7lbC0gNJjwfs5RQYYDZyF1rQ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=o2.pl;
	spf=pass smtp.mailfrom=o2.pl;
	dkim=pass header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=bKUk6b7c;
	arc=none smtp.remote-ip=193.222.135.140
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC03606A682
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 15:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC03606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.a=rsa-sha256 header.s=s20261001 header.b=bKUk6b7c
Received: (wp-smtpd smtp.tlen.pl 14720 invoked from network); 21 Nov 2026 16:53:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=s20261001;
          t=1795276426; bh=7bBGkEM1F0aiz0suHMTa/EpEpYTAohLosYW6UGvonyY=;
          h=From:To:Cc:Subject;
          b=bKUk6b7c+J7q4KDaxnIavfJr3SPh3UoqWCH2ZhRElFD6vLfGGTki0o0usy/MuKr3N
           MUFtP5NjhYV1aGTKeb6P4O5WGKNF9Z7X1f15gt62UQ4CcId7cl17Moxuu7PVMkxten
           6/t1bKBp/XWo6mGeLyTwXSIlylhv7YHvMmrHDLJm77Ilv54IFQqTtUrswKpHqnsloR
           3S8x0Hq8GMichFGpXeTqcYWaHeIc+fBh7QIEhv/lTKxoz9UvDGwo4r+3AmGz2HiDlc
           DsLgfRzxpRN+QGLCsHsOL1djyuuJsoUlABEBokI1vTb4sQNee4btT3G8OwGxq7p95j
           b+qKfrkK2cLXQ==
Received: from localhost.localdomain (apn-78-30-78-152.dynamic.gprs.plus.pl [78.30.78.152])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with SMTP
          for <oneukum@suse.com>; 21 Nov 2026 16:53:45 +0100
From: =?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mateusz=20Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: [PATCH 2/2] usb: mass storage: expose ata_passthrough_disabled in sysfs
Date: Sat, 21 Nov 2026 16:52:53 +0100
Message-ID: <20261121155253.4980-2-mat.jonczyk@o2.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121155253.4980-1-mat.jonczyk@o2.pl>
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
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
X-WP-DKIM-Status: good (id: o2.pl)                                                      
X-WP-MailID: 4a983041922b4c62b7c16f818300dc54
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 000000A [gXPk]                               

The mass storage driver blocks access to ATA passthrough commands for some
devices it considers buggy. As in the case of the uas driver, indicate
this in sysfs.

Signed-off-by: Mateusz Jończyk <mat.jonczyk@o2.pl>

---

v2:
- add this patch to the series
---
 drivers/usb/storage/scsiglue.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 97de28e85562..43198888449e 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -572,6 +572,18 @@ US_DO_ALL_FLAGS
  * Sysfs interface
  ***********************************************************************/
 
+/* Output routine for the sysfs ata_passthrough_disabled file */
+static ssize_t ata_passthrough_disabled_show(struct device *dev, struct device_attribute *attr,
+					     char *buf)
+{
+	struct scsi_device *sdev = to_scsi_device(dev);
+	struct us_data *us = host_to_us(sdev->host);
+
+	return sysfs_emit(buf, "%d\n", !!(us->fflags & US_FL_NO_ATA_1X));
+}
+
+static DEVICE_ATTR_RO(ata_passthrough_disabled);
+
 /* Output routine for the sysfs max_sectors file */
 static ssize_t max_sectors_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -602,6 +614,7 @@ static ssize_t max_sectors_store(struct device *dev, struct device_attribute *at
 static DEVICE_ATTR_RW(max_sectors);
 
 static struct attribute *usb_sdev_attrs[] = {
+	&dev_attr_ata_passthrough_disabled.attr,
 	&dev_attr_max_sectors.attr,
 	NULL,
 };
-- 
2.47.3

