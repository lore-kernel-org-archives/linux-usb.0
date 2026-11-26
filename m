Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695736;
	b=ZOxwNpt7deuFvWIE6Vs/VEk+JaQ6w6MH2/beWVXZsyieReFjVx+rTkDQzvwwC6a60cQi
	 G9wb7yTDY7Tz4N7pnzKgBplyFe2s21S7RoAhRucNCfPEedE44tNm13cF2m6KLJ36HBCTP
	 KqMUXRnr0Dng2vywmvkZQNx6wSlfi4FkdqWkmQdG2t/pcxtHrYPYxc5T2dxyUJNDGUvbY
	 QngrDXpjE3lResmfdKLk7I3kniaCtnvVVVtg8y65JFw2ZNs6ChZXWqkF49RZGNOwld7Is
	 V4D6kJtQ/kITe75ub32sjhK/HPrAnM5dKGClxkb0KqYBmuBWIyyCL0egnPc1qqeUD0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695736;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=flsa16xpnhEVnB89G5Tm1hNv5GEeMBlO/5Ik1OEDYzA=;
	b=Ls6rc33qZcEC22wK0C7MgpLfYJtMfTpwTH0Ys3NcwpKtz6Lo3A05u/tCibZpWtd9scZ/
	 2c9JnQrOYG6gH5Nz0NFBi3dV+342NPNtPJJd2FdDv9mSQq+04u4iSQ6SZxQ6W0sEhqeMj
	 L2Yr+THrmbiI8zJUFovxFYca48s0t7Su2wVBmov+ymyE9MTdH5Vb1HEjXXNageEjd5K1M
	 2u25SjecxLlDO1v2RvSwik90meH5J6TBXN1DV1XL+aUiEeI3Rf/KWcS3RbHOISkvflQA5
	 XL1Yx5ekNXUdxggzK7lWsV0mnFboqEJsLayPuPRo80T5MQhJjjPuW8FGtjj/r62830w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=becholey.ch;
	spf=pass smtp.mailfrom=becholey.ch;
	dkim=pass header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail2 header.b=DUZ0w0xm;
	arc=none smtp.remote-ip=79.135.106.116
Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF23606A335
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 12:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF23606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=becholey.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=becholey.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=becholey.ch header.i=@becholey.ch header.a=rsa-sha256 header.s=protonmail2 header.b=DUZ0w0xm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=becholey.ch;
	s=protonmail2; t=1795695731; x=1795954931;
	bh=flsa16xpnhEVnB89G5Tm1hNv5GEeMBlO/5Ik1OEDYzA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DUZ0w0xmbTBdngMllVyofNSVZnVP6tNxlT6yLoSNsYniQY7gzipd4JiV0bVFPogc1
	 RQ95YwlEKAhCdP7Z8gyW7xKzprECSUhb15xkMAuuEdyZRHCMCW82KlBsw1SZ9HgHan
	 YsnB+5goZFU5co+o/b+Ph1lGNp0dgJOGqBbJCmpiUiqiee14HZCSeVNVLcfnI5l+qI
	 ZQKVivB4OeLT+AATFv3EEZaeHv9165ytJjaf01f1ob3/f5ljsL7ijcSyULGdg4wUhM
	 WHhzgMn0KfXZnkpXee0tVElDF5ujlIegNkaw10xRU3I6AgHSz4I7WpKE/Jaf12bDLr
	 euD7Jw9Sf+b0g==
Date: Thu, 26 Nov 2026 12:22:05 +0000
To: Oliver Neukum <oliver@neukum.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Alexandre Becholey <alex@becholey.ch>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>, Alexandre Becholey <alex@becholey.ch>, stable@vger.kernel.org
Subject: [PATCH v2] usb: image: microtek: limit REQUEST SENSE transfer to the sense buffer
Message-ID: <20261126122151.414230-1-alex@becholey.ch>
Feedback-ID: 60743817:user:proton
X-Pm-Message-ID: 1b205770f7b6edefaf109dd955a2f56edc4420a2
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
Content-Transfer-Encoding: quoted-printable

mts_command_done() receives the data phase of a REQUEST SENSE into
srb->sense_buffer (SCSI_SENSE_BUFFERSIZE, 96 bytes), but with the
length of the command's own data buffer. A REQUEST SENSE sent through
SG_IO, allowed on a read-only /dev/sgN without any capability, can have
a much larger buffer (252 bytes with sg_requests), and a device that
returns that much writes past the end of the sense buffer.

Limit the transfer to SCSI_SENSE_BUFFERSIZE.

The bug was found, and the reproducer and this fix were written, by AI
agents (Claude Mythos and Claude Opus models). The analysis and the
patch were reviewed by a human.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Becholey <alex@becholey.ch>
---
v2: keep receiving the REQUEST SENSE data into sense_buffer and limit
    the transfer to SCSI_SENSE_BUFFERSIZE instead of removing the special
    case (Oliver Neukum)
v1: https://lore.kernel.org/all/20261119084526.535901-1-alex@becholey.ch/

An emulated ScanMaker X6 answering a 252-byte SG_IO REQUEST SENSE with
252 bytes triggers KASAN in dummy_timer on v7.3.1 and master
4405c18c95d2; no reports with the patch. An honest device gives the same
results with and without it, including the error handler's REQUEST
SENSE. Not tested on real hardware. Reproducer available on request.

 drivers/usb/image/microtek.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 1f0b3c44d388..09817ac6e3d8 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -449,7 +449,8 @@ static void mts_command_done( struct urb *transfer )
 =09=09mts_int_submit_urb(transfer,
 =09=09=09=09   context->data_pipe,
 =09=09=09=09   context->srb->sense_buffer,
-=09=09=09=09   context->data_length,
+=09=09=09=09   min_t(unsigned int, context->data_length,
+=09=09=09=09=09 SCSI_SENSE_BUFFERSIZE),
 =09=09=09=09   mts_data_done);
 =09} else { if ( context->data ) {
 =09=09=09mts_int_submit_urb(transfer,
--=20
2.53.0


