Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678576;
	b=dvReZHIZsS7w156N7/FE0ALAOb6b53OOZrcxc02NN9KuMRdbmUmtjUBGJ5tsBmLg7oJq
	 4BrDWNIA1zSZAlOYXU6gAOM0Ybc1w5jmmPAcJCmalO9FWLwz3YZLbCn2xi4bcdKwOrxO2
	 X5aQmYCZOsxRXM/NBgjyhedagbV1oTXrzLjl3EKW4YC0oq8bKzXw3sK9VlG+tWcVLymB7
	 U28rIBePLjfWZKVyfOGOZQuWYc+2UKtVJmh3mHTZUTYJAklZiDXxIxSJrPLHYAYIeoebW
	 JLVkd0nmejG/IYI26jeFN9bETQfkjPtd2yX8IeW48Znv+Hfjq6J2lmbRAORvdGqls/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9R09EBO85yEAu2wLYOFxIwiGkMThX542L/v6PDwTZg8=;
	b=ZAOVdRMezwIw2TIIptEnWnfUGjISTTqTNQ1/HHGTUn5VuFHl9a5xU5wcAk7xy335ETM5
	 9XqJInjfBGPvJs/PJg8tXM8RPudXgax/MxIANPI3CUOzScQi/Awl0L26nTb2SdKfoRWhC
	 4rZcsri9UoAZeagpjQdBnFqZcUh/QRPT2zlCIYSGVM3l7Mx4bn2Gq13W4Kr+qQyLGRA/h
	 sk429ARaTVPgz87bkEj1OfZ7CrS+p+IcKi3KN18AiNLyeq4V2nozxsZT3Niot05eH6BjJ
	 C7R3zhGcYSgwNQX51nCFb28BksBCe8d67wKu6T8xgp+jEvJrm1CY+rUvn5ptZH5TjOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CLCz7127;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87595606A327
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 17:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87595606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CLCz7127
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1067918f8f.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 09:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678573; x=1795283373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9R09EBO85yEAu2wLYOFxIwiGkMThX542L/v6PDwTZg8=;
        b=CLCz7127R0ADKRCNZV1Xd/7yL75XewT7Nl6X33+OYYwwyu713kQlMFo/4eiShsUV6g
         x9MUEiVIERNfgDq0ca18nbaJ0wfrBqnI2JszxRYt9Oqz72iqyQ33QWtwz6U5IBZ9Aw99
         ZWCZFIK5oY5URStKUN6V70mkrxxGNSLlsNKE3/I5PNLQVICGW710Nj4Q8fJjkQ75BBRw
         DnbR1p2wy7GqEB6UIC0xWq/6H+qFHgma9JrlmIEyzIKVMJkfwofCinTpBMVQrmuBaUTx
         /4g4M1H9pZkYQSd0ny8vjATLvgQfOkjabcZOIpt6BKoSr5pG0OfNr+E9YAfHWtXsCAK9
         Rpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678573; x=1795283373;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9R09EBO85yEAu2wLYOFxIwiGkMThX542L/v6PDwTZg8=;
        b=wJyKrJvZizsYADcCwUgz3hiXYcfxHPazSuzP7RblBfTxRCt87yhZuOuuRoT4c7GEK0
         xCzvrs/Yf62gE5ihoY7DmGqXLZ/Ryft5s3nF/a+850J26nCJuW0xRkd6anDOhrHGYBqg
         VSaP7qrxcD1TEub1MzJwPACbmsm9VtNQWt5R5H17k/SOd7/H3uok7E7MQ030/FHN4N2p
         MteHh8E3S82yS4EmhN29C3qOLEA9Rgu95ZnhaQjGBx1xbrXFjT+eh7E6IfUbqdhtBfHw
         oaBiMwrvLv4j3v0dYaE3FqeZ9LygVaBLdvYMbilJw+NB82zj0uS7eFYf2y46f11mJjVe
         MTaA==
X-Gm-Message-State: APuU4Z8j41sioacOeQ2UmGvFO/7hideRQ3ho2Jc95XotZo9pgHltJC4G
	HRteOmTJiyWEnOnNatd6xcjhFoV3bUR9tvSCgpyrnRl/3Gh0juEXID0FKLQ/bQ==
X-Gm-Gg: AYBFou1BoyD/bBiz4M6Y/5YMGc6JzKYPrYYNNtk+Jv+Rw/eATemhg9w2+ewqeOf7q8S
	OkprqB7xoIJuKAX0u4t0/aVsYEcmjfZC076ogclfc0CqQVP4+YQzH3ns23xMl270jG1Hb+iOXE8
	ie1k5KK9Pmjov5/qK4zrqK5jnTxixSLrBLBpmRREnYg8Y55nKnu9w1KBt1lMulbG2sqNOuDPIIn
	R1rCvGdI68NRJCNpILX8+S30JkWMvQkKUJbp7gm3WqFu55XV4gsWZANFSEEudPFi/lprvE9Fpk0
	e3IQV3N1No5ueZX+fJ7Io2iDdGaEpTcohmcaVOhIx7EjOB1ML4kTqQy0EWmj7Kh8THsIcK8hed/
	QFmYmW8N3acqdFkQ+UwT5fLuCLseswGSSt8U6Kbx/S2yryfj7v0lRLliCfmRHXNOp4sAX6bQYVG
	Pr0F4yms3d6r4VOq+O8N4BjN9yDQyOW6yvPbmOjLlxueF0c7tcruBDndmg9R2fU2jJ7xTJfC6rC
	nICuOZL6Xj7Fhv6zmMaLrzmY29XE7nOorqCTKj5E0p/Xq4Wt2x+SQSHljhSt8wbx1C8x1BN94fk
	F4KNmDexKxeuzvryeaMu/nNIgz3OdfZJESm5uy6OFnW8iZmQTZs06qIfEbBlVA0FL0j5zc+ufXS
	uuoFeNAVShpro8r//sakFlIMisQPOEHAaUxJlMqbcAs4RIe3nWKTFNeh5/78ey3aDJS/L94/CEz
	sc6X/yAs2NTeERVHewW5mXUy4mxeru9IFOc7EJ18Mn4td7MQMrSOfyK2QgvcNI92h9M9Wezw1Ai
	Uw1gLGnRznyN0qU0hNJ6gayY+8sG75o95C/mnzXkQk5YWdmKg==
X-Received: by 2002:a05:6000:184d:b0:48e:e98:8b64 with SMTP id ffacd0b85a97d-49c70ed94d3mr14656470f8f.19.1794678572558;
        Sat, 14 Nov 2026 09:49:32 -0800 (PST)
Received: from localhost.localdomain ([2a0d:e487:413f:168f:fdf6:7a1f:cf13:6d8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm6038203f8f.13.2026.11.14.09.49.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 09:49:32 -0800 (PST)
From: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	usb-storage@lists.one-eyed-alien.net,
	stable@vger.kernel.org,
	Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
Subject: [PATCH v4] usb: uas: ignore UAS for ASMT135x bridges (174c:55aa)
Date: Sat, 14 Nov 2026 18:49:29 +0100
Message-ID: <20261114174929.53871-1-olivier.kaloudoff@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

The ASMedia chip detection in uas_use_uas_driver() assumes that every
device with idVendor/idProduct 174c:5106 or 174c:55aa reporting a
config.MaxPower of 0 is an ASM1153 with working UAS.

ASMT135x bridges (iProduct "ASMT135x") share the same 174c:55aa id and
also report MaxPower == 0, so they take the "ASM1153, do nothing"
path — but their UAS implementation is broken:

- The first READ(16) issued by sd probing times out after 30 s;
  enumeration only completes after a uas_eh_abort_handler plus a full
  uas_eh_host_reset_handler cycle:

    scsi 3:0:0:0: Direct-Access  ASMT     ASMT135x        0  PQ: 0 ANSI: 6
    sd 3:0:0:0: [sdb] tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD IN
    sd 3:0:0:0: [sdb] tag#26 CDB: Read(16) 88 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00
    scsi host3: uas_eh_host_reset_handler start
    usb 6-2: reset SuperSpeed USB device number 2 using xhci_hcd
    scsi host3: uas_eh_host_reset_handler success

- Under concurrent load the bridge stalls: all inflight commands (20+
  UAS tags in the captured incident, mixed READ(16)/WRITE(16)) hit the
  30 s UAS timeout in the same event, forcing repeated abort/reset
  cycles and eventually a USB disconnect.  Writes dropped mid-flight
  during these resets returned zeros to the filesystem (observed as
  XFS metadata corruption on the mounted volume).

- Sequential-write throughput is ~45 MiB/s under UAS versus ~136 MiB/s
  after disabling UAS (usb-storage BOT mode), which is fully stable:
  several tens of GiB written without a single error.

- Bulk reads of healthy LBA ranges do work under UAS (~190 MiB/s, no
  errors); the failure pattern is command-timeout at enumeration and
  under queue depth / write load, not a broken transfer path.

An extended soak was also run at maintainer request: the device was
rebound to uas and pushed with ~640 GiB of mixed I/O over ~2h45
(randrw/seqwrite at queue depths 8-32, disk util ~100%).  Result: zero
uas_eh events; the queue-depth wedge did not reproduce on demand.  The
enumeration stall did reproduce once more at the first UAS probe and
self-recovered via host reset.  Per the maintainer, an inconclusive
load test still warrants the blacklist given the filesystem-loss risk.

Since 174c:55aa is shared across several ASMedia bridges and enclosure
rebrandings, distinguish the ASMT135x by its product string — the same
approach used for the HIKSEMI MD202 check a few lines below.  The
product strings of working bridges using the same id ("ASM1053E",
"ASM1153", "ASM1153E", "ASM1351", vendor rebrands such as "YZWY_TECH")
do not contain "ASMT135", so the match is safe.

Verified on an ORICO C10 enclosure (iManufacturer "ASMT", iProduct
"ASMT135x", bcdDevice 1.00, stock firmware) attached through an Alpine
Ridge TB3 dock: with the equivalent usb-storage quirks parameter
(174c:55aa:u) the device is completely stable.

Signed-off-by: Olivier Kaloudoff <olivier.kaloudoff@gmail.com>
---
v4: resend at maintainer request (Oliver Neukum will ack); documented
    the extended UAS soak results in the commit message.
v3: add braces around the if-body (per Greg KH).
v2: fix the comment block: added lines were missing the leading
    tab, breaking the *-alignment with the rest of the block.

 drivers/usb/storage/uas-detect.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/storage/uas-detect.h b/drivers/usb/storage/uas-detect.h
index 4d3b49e5b..523a17cf0 100644
--- a/drivers/usb/storage/uas-detect.h
+++ b/drivers/usb/storage/uas-detect.h
@@ -78,6 +78,8 @@ static int uas_use_uas_driver(struct usb_interface *intf,
         * ASM1051 - with broken (*) uas support
         * ASM1053 - with working uas support, but problems with large xfers
         * ASM1153 - with working uas support
+        * ASMT135x - broken uas support, shares the ASM1153 MaxPower == 0
+        *            signature, identify it by its product string
         *
         * Devices with these chips re-use a number of device-ids over the
         * entire line, so the device-id is useless to determine if we're
@@ -99,7 +101,11 @@ static int uas_use_uas_driver(struct usb_interface *intf,
                        (le16_to_cpu(udev->descriptor.idProduct) == 0x5106 ||
                         le16_to_cpu(udev->descriptor.idProduct) == 0x55aa)) {
                if (udev->actconfig->desc.bMaxPower == 0) {
-                       /* ASM1153, do nothing */
+                       if (udev->product && strstr(udev->product, "ASMT135")) {
+                               /* ASMT135x, broken uas */
+                               flags |= US_FL_IGNORE_UAS;
+                       }
+                       /* else ASM1153, do nothing */
                } else if (udev->speed < USB_SPEED_SUPER) {
                        /* No streams info, assume ASM1051 */
                        flags |= US_FL_IGNORE_UAS;
-- 
2.47.3
