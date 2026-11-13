Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794539736;
	b=tUZVYtdxz/FyOGqxFlr3wDLFoSlHCc8KdeJ0XDiwYh6XqWyTIjZG4NH4LgWopz4p/ZI5
	 rDcwzZY056/32nxN++r7QXIAxRgQAueo1TzQmEDJTMtB3C9yOJzLaHrwhlP+9TrNtsUtK
	 KoL/sK1fB5FQ+sXLfbsd3UIXnMGkJIYN2LoJcxoOuvosjqDpWN2uGG5Ddkv7lDFL8J1dy
	 djI6HcdzhoGCWA2opjib517spVYzMXKElL/FR5x+MJWc6dq4GgR1qWZLegK9fjMRUP6b0
	 hcEHVjMGlJUggobdXRwuJqYutM5YXHNPMuSM7fNSp6mWzOkymM3PcEUkwfFmHvDqvFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794539736;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4nFthIYmWb5MY21KI07AtALi9u6st9j91PI2kbKderU=;
	b=Ej5zMw5d/lgPpV9k5TotBr430ioiHvGvVjKLbyPx1dwp3lUTHJOJ8no1G/TzUPgpD2sk
	 4NoyWB3YiwlFP6PQZgTPovQHqhK8lqD+k/E+NSvlmYFdfJyW7hZdaSTWjEdyAsAi9FBYd
	 SWYeDIpusrg9AJ81kekQKG2WIdY0DYhn3xLsoF3A+S+dT6rRm7Uu1RrQtyZyix0Bbv8fO
	 hGHmpkvvF8KxX+TeOw0GqGIIvbd1sIZfHD6eMBBdSvVEwjq2FNkzgsAUYR64Q87D8rK0E
	 51KjwN9E887lIEjul1AbltLb2eRwmQPpD6AJ57Vrn8hVEzb4dJvwhFtoKchxt2a+NZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAE8606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 03:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAE8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7a735304df1011f19a56ed5b684f684d-20261113
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d7d1103e-c8dd-4361-805c-74941dc6837d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:47d9b534cd9779d7737c3448b095b9df,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99|100
	|102|153,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a735304df1011f19a56ed5b684f684d-20261113
X-User: lijiayi@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1288505443; Fri, 13 Nov 2026 11:15:29 +0800
From: Jiayi Li <lijiayi@kylinos.cn>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC]alpha implementation of eh_abort_handler for UAS
Date: Fri, 13 Nov 2026 11:15:06 +0800
Message-Id: <20261113031506.98150-1-lijiayi@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a0dd6b5d-d82b-4586-9a96-725f1ed45eb6@suse.com>
References: <a0dd6b5d-d82b-4586-9a96-725f1ed45eb6@suse.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Wed, Nov 11, 2026 at 03:23:58PM +0100, Oliver Neukum wrote:
> Am I correct assuming that this is supposed to say tag1 in all references?

The tag2 reference was intentional: the helper READ used tag2, and the
following SCSI READ used tag1. The host cancelled the helper's
Data/Status URBs after its Command OUT URB completed successfully.
The following READ timed out and entered EH.

These earlier tests used host-side Data/Status URB cancellation without
unbinding the driver. The interface and streams remained unchanged.

> So it did not also get an RC_OVERLAPPED_TAG?
> I am asking because the spec is unclear in that respect.

Correct. Only the original 112-byte Status receiver received
RC_OVERLAPPED_TAG. The additional 8-byte receiver remained pending
until it was cancelled.

> Thank you. If you allow me to do so, I will take up the suggestion.

Please feel free to use the notification change.

> This is interesting. Can you tell whether TURs were submited for these
> eleven commands?

In each of the two earlier concurrent Ugreen/SK hynix runs, same-tag
TUR Command OUT URBs completed successfully for all eleven commands
whose abort returned FAILED.

> Could you review and test the attached version?

I tested your attached version (18751892) on 7.0.0-42-generic with
ZX1 512GB and USB streams enabled. The UAS source changes were limited
to the host_lock API adaptation and raising the single-command limit
to 8MiB. The EH code was unchanged.

To exercise timeout-driven EH, each SG_IO READ requested 8MiB with a
1ms timeout. A separate test module scheduled timeout checks at the
requests' existing deadlines. It did not cancel URBs or call EH
directly. The single and concurrent cases were each run once, with
the device replugged between them. The original requests returned
timeouts in both cases.

In the single-request case, the READ was still outstanding when EH
submitted the same-tag TUR. RC_OVERLAPPED_TAG was received, and abort
returned SUCCESS.

The concurrent case submitted 32 READs, with a peak of 30 outstanding
requests at the configured queue depth of 30. All 32 requests timed
out. EH submitted 32 same-tag TURs while the corresponding READs were
still outstanding. All 32 aborts returned SUCCESS.

In both cases, RC_OVERLAPPED_TAG reached the original 112-byte Status
receivers. The additional 8-byte receivers remained pending until EH
cancelled them with -ENOENT. No second RC_OVERLAPPED_TAG was observed
before the additional receivers were cancelled.

After each test, 37 further READ commands, totalling 152MiB, matched
the reference data. No further timeout or EH occurred. Neither
recovery nor the subsequent reads required a USB reset.

In separate tests, I also reproduced the following three issues
identified during source review:

- uas_abort_complete() uses cmdinfo->killer. The original Status
  completion can wake EH, which may clear this field before the
  callback finishes. The callback could then use NULL. Using the
  URB pointer passed to the callback (u) would avoid relying on
  this shared field.

- The bailout path calls usb_free_urb(u) when buffer allocation or
  Status submission fails. USB core also drops its submission
  reference after the callback returns. EH later calls
  usb_kill_urb(killer) and usb_free_urb(killer), which may access
  an already freed URB.

- The resetting branch jumps to futile after setting
  TASK_UNINTERRUPTIBLE and adding the wait entry. It skips restoring
  TASK_RUNNING and removing the wait entry, leaving the
  stack-allocated entry linked when the handler returns.

Regards,
Jiayi
