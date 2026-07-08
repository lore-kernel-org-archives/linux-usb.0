Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA823F12D4
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527863; cv=none; b=QoW0XiOk19yNgkqY0tO9GwkO7Qv4l9HePilvTMl5rudRPUZMFSCMMnHpfr4YXNjmy8yD678oPFxGJT4XwR6b8B7exwQXvkJOGRunGD4+sgrWQ8zQ+hpHTxaB1Ko8gFnOepRAN1NPhc10aHpmBws3dyYseHwI/PEA24LtW9JplGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527863; c=relaxed/simple;
	bh=F057RQ5aU71gMPjItc9XsyvIIqOxx6TbKks5RjUAYN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkbABx40zPlKv0fyUW9/1kOuu6EAJ/9Cp1lumhkFz71UV8eMfpryjoY9NkMX85BeYKgqypoI861JTELjrGIXozMZ/kRikj0bsSj5oXMkEbGP+DOnJjOEjJtsY0yALTxsSQBcyw8tSlIFXQ2ObS/fcSiXPvQ3t2SXUX8kQ2vuX+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CpLHeo1z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CpLHeo1z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so8667985e9.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 09:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783527860; x=1784132660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gT1mEc3Dr8A1jUKsh6HVw6wMy3cuHVm/hAqGsXnWygs=;
        b=CpLHeo1zxOsKOy832uIOR1Fbf3ua+7MU1QBvoaJ8e/S1+/2BJePyCFvmv+3YrUgUfP
         szBEACYoPHj7XVAWAo+fqPr6/Kq+aTEAJBDfa4lUg88g0jlUcRJQde9ut0wSkl6o8R0T
         QKtuZVjHXKbdAlWQnIpS+tLHVc4WkCKLMRCpfm2fF6LA1Utmr7gcQ+duLZ/Ip7ZR8+9K
         nr1TIZJaOwbzH7bBUa24ujvD6aM6gUTCOtItuhond6iG7TIJzS6IflzuizgJJs8t859E
         6/oKunO8LY/Jb5B6gl65pMiY1Q1BnuhiZG54r29gQvrbVWTn2Gu/fhmhykeg+ztfeAzN
         /s0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527860; x=1784132660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gT1mEc3Dr8A1jUKsh6HVw6wMy3cuHVm/hAqGsXnWygs=;
        b=Q67zDuSWvimAGaljk5q/F0nNI0IUI2N/DCzRNG8jp8wLrlbjmPcZ+HEh0V/MIgXP3P
         KQ6DipaSRf3a3DbQCKzJIteNVcZEUeDZQco8fQjHiwbIwoyCJVdTG34x4XZELR9hHoJt
         kZpWvrlbNPUE7aMncw6JPQJn1Y31JTO8NbX+7PrvzmX6uCexmA93MT57O2NWK9om+xjv
         xoq+/OcU2TG0ysVgQnjH4Dhn168iNw20iR7aXQpnOAOErN59PVUHI8L8/4PLwYGQpgjp
         w3VD1FwB6VIgAMmuNixsm+htMWe3Pmxzrnk0OHqrF8gCsqWN33T9HXAbdNkrC7Ak+lN1
         YHew==
X-Gm-Message-State: AOJu0YxID2LtwPOcDjp+6th0yC6Pr/RjUC6Vx87okZtFDQP9LCCrTBsK
	JCh3gZqgouALeP3tNsvLcIJ5wpwkmZa9qBw7viI+Vb8FAVeXZnZMrSf7ufYtgcYo1KE=
X-Gm-Gg: AfdE7cnIh8Xp4TNi66kogQSYYLURgdZxvDGDgwVFNBUYfTWVp/OMUAQEMldZczFjzvX
	dmFtlp3FElSNV5888vw33Eo9knqJh49f/cCthilgZP2berKZqkeIsDL4FP4EOtovadvlHdZuX7q
	EABm5wF0mFa4f1bC3DmG4ddqpEkbBV1r5NDolRWuzteWP/rx5j1KU6SeUI1TStif1DLHHVb+o0Q
	+QHX4hbwUv1n2tZtkdU+o5jvPcB8WmcIMWfu1mcUKCubHp0FBKe7+T9nK2Aooe+nSqfiBNTD/Qo
	dzwcOf7GLgpT26JOkjdCACQSabfoiqC98ig8YpDBd0SihMgAnVEF+qGf55ENoTxKdQxr/SkHHPJ
	4/wKY3H3rhdLmoIwarOp94isswOWI5b7tatGY1BSgO37V60qBFAWTxgQ1QaA2SPqv1gfrejwGGf
	LcuYvc4tbsgFE27vDtKgjXyJnhyI6WuiY=
X-Received: by 2002:a05:600c:3111:b0:493:aab3:c09c with SMTP id 5b1f17b1804b1-493e6a4a8b1mr33097185e9.28.1783527859686;
        Wed, 08 Jul 2026 09:24:19 -0700 (PDT)
Received: from [10.128.60.8] ([81.92.17.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f4e3afsm172344925e9.7.2026.07.08.09.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 09:24:19 -0700 (PDT)
Message-ID: <232723a0-328f-4929-9525-d5f00d498636@suse.com>
Date: Wed, 8 Jul 2026 18:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: gadget: function: rndis: add length check to
 response query
To: Griffin Kroah-Hartman <griffin@kroah.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-usb-gadget-rndis-v1-0-e77e026dcc6a@kroah.com>
 <20260708-usb-gadget-rndis-v1-1-e77e026dcc6a@kroah.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260708-usb-gadget-rndis-v1-1-e77e026dcc6a@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08.07.26 13:08, Griffin Kroah-Hartman wrote:
   
> @@ -598,6 +599,13 @@ static int rndis_query_response(struct rndis_params *params,
>   	if (!params->dev)
>   		return -ENOTSUPP;
>   
> +	BufLength = le32_to_cpu(buf->InformationBufferLength);
> +	BufOffset = le32_to_cpu(buf->InformationBufferOffset);
> +	if ((BufLength > RNDIS_MAX_TOTAL_SIZE) ||
> +	    (BufOffset > RNDIS_MAX_TOTAL_SIZE) ||
> +	    (BufOffset + 8 >= RNDIS_MAX_TOTAL_SIZE))

Wouldn't those last two lines be more efficiently done with:

BufOffset >= RNDIS_MAX_TOTAL_SIZE - 8

	Regards
		Oliver


