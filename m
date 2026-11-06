Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793961259;
	b=hratvtlm6pZbkM+D8eqo5zvx68aMcFIouxhwh3t+JZMPxMGH10AHH98rh565z1hSFnqB
	 vx6r2amDEy84Niz61TFzSZr2DXYNTmaIgcQqBXqN7zKSMYVHF52/YHvYH3/Y8hdq54kYJ
	 kuo80gAOw+yCS1pEMzDSe+NzrgIFm3R6OXFg5EyrX9B36c4BxMHqeR4ExJeegcOs+wYU7
	 0+5dhy2RxpJYfgkFR/k+6YeLUsbOuflus8Q4K30SCsmUBd5gIDfK86SIRT/+T1yba4Aq/
	 8vVqur5AEC+gngSPC7TJ+Misi/ArvS3QLuwQqzWT3pfy2aQLWmkg8VBqBs3lfqp90Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961259;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dEt14MCTgHtDscVjh3wCcpDDdGElzkLglcIsbl9Dr80=;
	b=Nfr/f6BfOMSoa5kh8td8vjSPwuCF87KmQ4KrQVtr5NcPn/wPQkq2UKpk2y4IW6lkLp2R
	 QatQH8y4xB1Ly3HPTpWS2DYmKcAWQKrXuQDP0lLw3QA2kIcX360klYAH3JBryBx/Zki7J
	 K2uGUfRaDMox4BxDPB/kI6fMdWk7I58ekJf1/yWmqscV0pUl3IJrsRXoPuHhtCHH0d9cq
	 HgvY6aLl+7aPazSAEColSyYu449PrmsOjXLIpWKsv2JSfo8qwkbu9FcO3nTPmtU5Rn+Mt
	 vCU7SWuORi8akjOwnVOcrMjz/ToUm7lqhr9BYdem7f2Q9n0XWeePGzR0bNwtJuy/+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CBC606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 10:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CBC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9ad3349ad9cd11f19a56ed5b684f684d-20261106
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:eef01813-921a-4d59-a6f3-bed489c4498d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:7db8b62,CLOUDID:bd7fbc408c1230ccea70b1de3127bebc,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|865|898,TC:nil,Content:0|15|50|99,EDM
	:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ad3349ad9cd11f19a56ed5b684f684d-20261106
X-User: lijiayi@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 206249821; Fri, 06 Nov 2026 18:34:11 +0800
From: Jiayi Li <lijiayi@kylinos.cn>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC]alpha implementation of eh_abort_handler for UAS
Date: Fri,  6 Nov 2026 18:33:42 +0800
Message-Id: <20261106103342.3945373-1-lijiayi@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <38f81744-9122-4109-90b6-b0a1ac92d248@suse.com>
References: <38f81744-9122-4109-90b6-b0a1ac92d248@suse.com>
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

On Thu, Nov 05, 2026 at 08:33:33PM +0100, Oliver Neukum wrote:
> the older version had serious bugs.

I tested RFCv2 and the local changes described below on 7.0.0-38-generic
with USB streams enabled. The host_lock accesses were adapted to that
kernel's API. All tag numbers below refer to UAS IU tags.

1) RC_OVERLAPPED_TAG can reach the original Status receiver

On ZX1, I submitted READ(tag2) through a test helper, cancelled its Data
and Status URBs after its Command OUT URB completed successfully, and
kept the interface and streams unchanged. A subsequent SCSI READ(tag1)
timed out, and uas_eh_abort_handler() automatically submitted TUR(tag1).

During the abort wait, RC_OVERLAPPED_TAG reached the original 112-byte
Status receiver. The additional 8-byte receiver remained pending and
was subsequently cancelled.

uas_stat_cmplt() processed the Response IU but did not notify
cmdinfo->cancel, so abort continued waiting and returned FAILED. For
subsequent tests, I added this notification to its IU_ID_RESPONSE path:


  if ((cmdinfo->state & COMMAND_ABORTED) &&
       ((struct response_iu *)iu)->response_code == RC_OVERLAPPED_TAG) {
	  cmdinfo->cleanly_cancelled = 1;
	  wake_up_all(&cmdinfo->cancel);
  }

The locally modified RFCv2 also uses u rather than cmdinfo->killer for
the follow-on Status submission in uas_abort_complete(), and leaves
final URB freeing to uas_eh_abort_handler(), including on submission
failure.

2) Recovery after read cancellation: single and concurrent requests

These tests used the Ugreen enclosure (0bda:9210) with an SK hynix BC501
and the locally modified RFCv2 described above. The filesystems were
unmounted, and reads used the normal block/SCSI path with O_DIRECT.

For a single request, I cancelled the Data and Status URBs of one
512 KiB READ and waited for recovery before issuing further reads.
EH submitted a same-tag TUR, RC_OVERLAPPED_TAG reached the additional
Status receiver through uas_dummy_sense(), and abort returned SUCCESS
without a USB reset. A new 4 MiB read and 128 further 512 KiB reads
matched the reference data.

For concurrent requests, I ran four workers issuing 512 KiB reads,
cancelled one READ's Data and Status URBs, and immediately submitted
another 4 MiB read, which was split into eight SCSI READ commands.
I repeated this twice.

Each run had 12 calls to uas_eh_abort_handler(): one returned SUCCESS
after RC_OVERLAPPED_TAG reached the original 112-byte Status receiver,
and 11 returned FAILED. One automatic USB reset followed. The added
4 MiB read and 128 further 512 KiB reads passed data validation in
both runs.

3) Actual driver unbind/rebind results

I started concurrent block-device reads, confirmed pending Data URBs
at usb_unbind_interface() entry, and then unbound and rebound UAS
through sysfs.

On ZX1 512GB (2109:0715), using RFCv2 with only the host_lock adaptation,
the first command after rebind was INQUIRY with tag1 and a 36-byte
allocation length. Its Data-IN URB returned -75 with actual_length=0.
EH subsequently submitted TUR(tag1), whose Command OUT URB completed
successfully, but RC_OVERLAPPED_TAG was not observed. Subsequent reads
did not recover.

With the Ugreen/BC501 combination and the locally modified RFCv2,
I repeated six rebind tests. Every run had 30 pending Data URBs at
usb_unbind_interface() entry, and the corresponding READ Command OUT
URBs had already completed successfully.

Four runs completed without EH. In the other two, a READ at LBA0 during
post-rebind device discovery timed out. EH submitted TUR(tag1), and the
original 112-byte Status receiver received RC_OVERLAPPED_TAG. Abort
returned SUCCESS without a USB reset. Three subsequent 4 MiB reads
matched the reference data in each of the six runs.

RC_OVERLAPPED_TAG was not observed in the ZX1 rebind case, and I have
not yet established why.


Thanks,
Jiayi
