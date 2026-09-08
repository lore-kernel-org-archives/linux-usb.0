Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3B3998BE
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 06:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850482; cv=none; b=bzjmQbtxmjo8S9vZjO04ZO/ZsKEl5LxZ2lB+Z950strZnYVzOCtzU+5d1Ih8aWSQ8xTLe5jEd7Gh/iQdp1KtHACInRzBYQHXDvRvo5lwREz1l82bnNUksCRXXI6E6Ykxgb6EtEtBwejR8QIR86fJBR7omIqH6DMO5b0eTF6Xxxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850482; c=relaxed/simple;
	bh=8M6z+qNZsXjdHj1Arq1lJ4ckmm96BUf5o7TGzy5MZkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FBQadyrqk0mvNFl00u/j8W9WWCWtefyTqePD3br5xv3pqWfMRtI+n24a8rWRaj6os73WrUIW08FFE5ZGyN6vuS872NiHXH4pQCVcjA6C/z5tKfvpCOrSKC31XUq9laSKPHcqfDNlmW6uv+sNpV3MfatYCCO4rqgWjOGlfnZ2LM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IOKrvY2K; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IOKrvY2K"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so2607281f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 23:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788850478; x=1789455278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSW1BLEU3v6mP8//6sbr91+EPSlg8/lSl3HQ6CfDTOY=;
        b=IOKrvY2KryBIWChEm92ybolZrxZrL/G03D8evQV42Xb5dN28oS0hKtwqx9ZX9u99hj
         398PG5DKK7xB4uso1JyQFQjkhnE3XB6+A7IWicnomvur+A+Rl6SKFxgGkw43YDFHVWWi
         PiAz/YAOppRxa+KhF9Qbsaln/CQG6daj0cp98POv1QYq8o0+w/hSCK99UT6a4jObVkKz
         k/u4KwAgLifyoQKdl6GlcOuHqRzjOJUhQTQbn8K/XM7pGM3Xy+GtEPqDMCSNuTpzj8f0
         QARfIz1AmMq1eY+qRrEE8ksqUPVl8AiC5EksyQnpEoiTp1FwI3JuOYNNzX7d/6FnlQec
         yjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850478; x=1789455278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSW1BLEU3v6mP8//6sbr91+EPSlg8/lSl3HQ6CfDTOY=;
        b=Mivz9jgGyoprt6DrLG2vDnFKmAZOYHV0dtQSFiS20mbYz7cD2vE79WmaFCd84hchy9
         TecWYVEq9V5JhMI7WZcAByYEW+VdDSoK5VIRtu2myGCTAxffNZNPADYz76XgKbWoDSj7
         ATgQt1jJplACWKch7m7waniCDezCcQmV2JbFj1kFAqsns+7cqWkIOWyL2+Mtoop23/nK
         Sh4jQQTxWIqNUJ+KSaJYL98wEJ2pkTXn3IvXC5/J4xqp2Oql+t+o4EE/YP1/9Zb82IK7
         79nzE5Ttv+kc4gi7SHnEgKeu+FD7ZrYuyuX5tcm71cP+d7/Iw94Xqxpbh6FI/uFoauDx
         /kBA==
X-Forwarded-Encrypted: i=1; AKwUvBwtofTS8fVbgw9rs8mmm0gAd/MFhEbIMscuZKV5tAVwuzGG8wNYauHvWd2k7PbuPrBqPkaahKc2sQA=@vger.kernel.org
X-Gm-Message-State: AFuF++mOQuvWtYY6wJbSFs20h2kgHMQ3GOmTmXEFESWUkHSttPYtek24
	jgTthN5TAIQys8YA53DR3EJiBjSoYg37Y4hquTUgcgUmOWOikb+oI/o95M/5tq3BxMY=
X-Gm-Gg: AYBFou2UPnpVN/n8dSbSzkU6klGNp+hyy8aNiAzFgyJws74EoPN+hyXWirF/1AQDnHR
	xMB6JXp4rqdVpcHBYUMMtRkXqWvS2ULy+f9xc2Um3OmaczOw5Wi6NGqMUxNXXM7xXcHTxxjoHbr
	+2ihHiy9NwgoYjYlBdl5TA/bfPunOK2xw/VLpa+ww4JwDLOJ4yvoFz253J5YHNcfkbLh60axbWp
	kBABaagBSY/BP0b1mZl1BCsbTL98th+e5TpiI52jZIl4ZDBc026aFxSQysp0Z8vjykSIsBBv5eo
	kaSr9seBlZe5zmUNNZZAXR45JLvigot6u6Vl2AYojBh01ZENRDnHdo3TIONUjPLxB4RnB09qGK1
	Y3xX2rycRpT0LhtHwJVb5WcqcUUDE/4iMpWe4X3UHc3El+d/Iq788T7wvcyEkx/ej8P1ORFm8IV
	638Tfmz0ZjnSRkEtNJz52791yNDFdrahiPofy27FbzvupurvJpphHoRlP5gNSttaGEKPXR8cqLr
	qbHUxd/IiREokHJBT7Lg97NReQ=
X-Received: by 2002:a05:6000:29d3:b0:482:eab2:a752 with SMTP id ffacd0b85a97d-48587046b42mr42417146f8f.1.1788850478324;
        Mon, 07 Sep 2026 23:54:38 -0700 (PDT)
Received: from ?IPV6:2001:a61:134a:e01:4312:e944:2d81:13bd? ([2001:a61:134a:e01:4312:e944:2d81:13bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm32167817f8f.36.2026.09.07.23.54.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 23:54:37 -0700 (PDT)
Message-ID: <a9db0fce-2a2d-4896-a3c3-2afff4080168@suse.com>
Date: Tue, 8 Sep 2026 08:54:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
 <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
 <ap56NTVMq8GlbjmR@hovoldconsulting.com>
 <72615ee3-46eb-4639-a408-ba29c1235d08@suse.com>
 <ap6LcHWDvIWF3oNK@hovoldconsulting.com>
 <bc055887-3029-4740-bec5-7e2fe4205992@suse.com>
 <ap6iJ6vkVIaxXFwn@hovoldconsulting.com>
 <f642f815-df4f-473b-aaa2-89153c08bc05@suse.com>
 <ap62IbbQti28M_SA@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ap62IbbQti28M_SA@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.09.26 15:03, Johan Hovold wrote:
> On Mon, Sep 07, 2026 at 02:46:16PM +0200, Oliver Neukum wrote:
>>

>> We could do that and it would indeed be simpler.
>>
>> But it would change the semantics so that past status changes
>> no longer show up in TIOCMIWAIT. Is that really a good idea?
> 
> Yes, as the current behaviour is both non-standard and inconsistent.
> 
> If you have multiple tasks waiting waiting on status change, then only
> one of them will detect it, for example.
> 
> And if there are multiple changes (before or during TIOCMIWAIT) events
> may be lost too.

Very well. Ample reasons. Do you have a patch or do you want me to fix it?

	Regards
		Oliver

