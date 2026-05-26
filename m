Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC507405C41;
	Tue, 26 May 2026 17:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815640; cv=none; b=oFQZAt/83PNp0Zz6J54CpV5oiG4UrGy7VbaVMT1HZgBrGN/HpGi1qFyhX6tv3gwGuNWrPBq37RZtl5E8Ow5MTdL8/rM7jNFvA7A0XKE45rTBnuf/n/GFGqIiGZgI4YYFjDCGI+Qpnn2ZFJR4SYQ/c20S8kx7YBkEOqrAH2F+RfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815640; c=relaxed/simple;
	bh=HKf/Xs8LOWQfuYm/NhwoSviP4MkBPUdp5MQqBgN7XDs=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=e/bYMgEBbr40N5BfkP2Z5LaHDgT/eQusIWHrcgppLE59Mpgvh/lBorG89eLwPcTzOaq/aE5f4Sgzn7ekcc2tgb9DO2862JHMCNOh/UkZTlqxkM4qLHZluCgRR9Df+/AYO8oyxqlPdTlqn4bHZ7xSp+gZay6BKiVzgEcrSzbQCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pnjNklEp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pnjNklEp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/G1S5XobYG9/v5zfN4G/+aemLakN1IaljOQrRg4fvFo=; b=pnjNklEpsBg0bQVHBDTK1mR9/F
	TE4Q/gwiISSYMpJOXppjkUJxROLK6jscuYvRCf5BWViJzigd140J73gtuyzx7PE+tFZFKNR4DNwUO
	sukCVui1eCBfvon528qe75R/OeRONlUjGKM/tSqWJr6MeLrVr1rqdgzOm27HRPXdewlXfBezgd6t5
	oQJNTnU1a4o799V8BkhETIrh216atIsNCRajoHSNOMB7DEI9S+ceeJkelakgnsd/CK3DQXP9rGc9d
	0+wabQWSsot9oTFKT3LgCta7q/6YmMA8VkbzhkGCRkLuszf64fudtB2RYS4NYrb7+VmFnlu5s2nM/
	TfBW7lWg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wRvLk-008X5L-Da; Tue, 26 May 2026 19:13:52 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wRvLh-00FZsO-TM; Tue, 26 May 2026 19:13:52 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wRvLh-00000004M1A-0ud2;
	Tue, 26 May 2026 19:13:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 26 May 2026 14:13:49 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Matthieu CASTET <castet.matthieu@free.fr>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@osdl.org>,
 kernel-dev@igalia.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrey Tsygunka <aitsygunka@yandex.ru>,
 syzbot+ce1e5a1b4e086b43e56d@syzkaller.appspotmail.com,
 syzbot+306212936b13e520679d@syzkaller.appspotmail.com,
 syzbot+457452d30bcdda75ead2@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: atm: ueagle-atm: wait for pre-firmware load in
 .disconnect()
In-Reply-To: <20260526092456.GA45806@wp.pl>
References: <20260522-ueagle-atm_req-fw-sync-v2-1-eee7f6b823a7@igalia.com>
 <20260526092456.GA45806@wp.pl>
Message-ID: <c374af62869016d43f54345c5fad62f3@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-3.9, Tests=ALL_TRUSTED=-3,AWL=-1.718,BAYES_50=0.8
X-Spam-Score: -38
X-Spam-Bar: ---

On 2026-05-26 06:24, Stanislaw Gruszka wrote:
> Hi, 
> 
> On Fri, May 22, 2026 at 01:45:35PM -0300, Mauricio Faria de Oliveira wrote:
[...]
>> @@ -2557,8 +2561,23 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>  
>>  	usb_reset_device(usb);
>>  
>> -	if (UEA_IS_PREFIRM(id))
>> -		return uea_load_firmware(usb, UEA_CHIP_VERSION(id));
>> +	if (UEA_IS_PREFIRM(id)) {
>> +		struct completion *fw_done;
>> +
>> +		/* Wait for the firmware load to be done, in .disconnect() */
>> +		fw_done = kzalloc_obj(*fw_done);
>> +		if (!fw_done)
>> +			return -ENOMEM;
>> +
>> +		init_completion(fw_done);
>> +		usb_set_intfdata(intf, fw_done);
>> +
>> +		ret = uea_load_firmware(intf, UEA_CHIP_VERSION(id));
>> +		if (ret)
>> +			complete(fw_done);
>> +
>> +		return ret;
> 
> If uea_probe() returns an error, .disconnect() should not be called
> so complete(fw_done) is not needed. On error path we should just do
> kfree(fw_done), right ?
>
> Otherwise, the patch looks good to me.

You're right; thanks for catching this.

Tested and fixed in v3:
https://lore.kernel.org/all/20260526-ueagle-atm_req-fw-sync-v3-1-93c01961daaf@igalia.com/

> 
> Regards
> Stanislaw
[...]

-- 
Mauricio
