Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A58637A496
	for <linux-usb@vger.kernel.org>; Mon,  8 Jun 2026 12:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922153; cv=none; b=pKsjT7vLmbCJ7NTSKCd93YJap01ozktXfB9+VgtbnLsTgJs7aKQ1FeZA7RA187n1xILYC5F7LHpjMXRlSqnbk66VvYhBXwyOh9u0lAuZ8kZIQLBj2byANocnGhmyeFKsv+OUy1GtrjPIl+AzoPuyxmOOZXk+HAV2aKiDlQY88Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922153; c=relaxed/simple;
	bh=JTGd1LBTdDOBJyRQCLk3uPewsMPzrx/aPqWqxPfyuLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWWPc/DwdZgAPVJHUdW0SqMppeaHfU9pFDKGoZb8XuqfOp2JWJNBJbgPka6BpoyLsO/dI2aUpm5RCRFzN9+IP3OwdUAgFwW7gGnU0/jDq8Cql9X7i8UNK1w3yGJpb7huL8Mxi8YsJqmohM2bFEy7gFBA1RXbu4/g5AxmMRQj9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mj0cUn/t; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mj0cUn/t"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b613a17bso41652625e9.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Jun 2026 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780922150; x=1781526950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhpb1SiXWLYg9nlqk/FRfJQLWKwq8Ly+6J1VhYeN02A=;
        b=Mj0cUn/tQn6TjMeih6S+25OIjXOfw2zmkPXpLC7ElNmA/3n7fcHuWVCQy98Pc534oy
         LIowRc13h04crHysHcsaUIr/aICfEmCbKcmhkG4XQeCeKy4lde+ef6mA9WoD+kscJYlg
         sHIovYfFB5BhJn2VDWnpSWQLZo8u99SV0NRMwbXAAO/+/tylpGj0G+txyQmzxLnSk6dV
         OYMMhQMNWnZ9I/YXn8JlgXUAp3q6rMNzVR9w+f68CFm5p9w7FnTO4/Jom4/Tgr6g0oiC
         LcA0vDOtJBQnd2MmBBpEUTbTBlaRxXMEE93b2ZuZo/NqyO7vosdYDzNpvqmKj2C+7LJX
         RZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922150; x=1781526950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhpb1SiXWLYg9nlqk/FRfJQLWKwq8Ly+6J1VhYeN02A=;
        b=mddXdnjIb7DPurZv+q4UDMmZxm61OZZc83Wcc4ojvft3syWDyJfmBzcWpd1GdPvyHp
         JrUZMB5ODItTMc6TYaou+e3FwfFynu91a7eup6yuBaMCiNVcykIyr1JE2NV4cK5wB10t
         07BRQpKPOkus73iHUdStwagXfvvn/wi8lF1FAkzutN53M4kPdflIHQKlti6C9rfw/f5e
         PaLQpDyGVifjYUR/ijU14i9gxgDFEAUtbC8697Kup0ELn0IyBh7sEJAIOXsnPyLs3G+V
         FGvwYUo6YENCei/s4qNeKzJB2JtYjB7YUixyfr3ulLpt98MkGdOQtZq2jJYZbxa0ODUL
         sGSg==
X-Forwarded-Encrypted: i=1; AFNElJ+JNT6UEMszNTzGUjBSeu111CCJtWIgn5C6u128jY5sUnTe3JXEjm5RI5oFSUW0wsr/W2KW07sWoVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUIaXnkBMfFCL/o80fyvFX+D3JvlGDGhT5Qe9ZCf9lr6XIqV38
	NP/evQb9UPMxD/baRwZ6kJ4QMb1k1Aof6oU7hFbqikjy92YI5KvkkVAbkZVefYdeaackajpL9ut
	PGyL2EOU=
X-Gm-Gg: Acq92OGwZS3Yd624l+e4ZEBdIHQF77L+NVYBlBQurWIiCAtHfBNsX9A0EhgXFDAvHIs
	yRMGMo98Cd+Saio7isBg4A7NVXCLiI35nyUcPnjrXlUQlnix4Xg/9J8GoqZm0BhprB25cAZjYt3
	TUFaSn5xohLmFCnGYm/NJBWSRfPSEdO4uBhf4EnNA8dyR7lhTN+kBT4t6mHZCoujCtx2wFw7x7H
	UuGcs9mzXAlb8tBdUsMbN3X3+DmPeMfW7AuWWgn731562lHnHPpX7splDJV5hy0XGTKWIPse6AH
	kWAOUx4nfrAW3hpo5XP4lJbZP2nAxvOsKdBw1NRd2wTukamO36kzDDyw0sQCWQBbpAZe4mdZYXc
	TgA+HQkq7MejwvV1oLJuiYbDFbarnQ07joOweSwK4AHoRxaQSqnoZdW5I7UsRyf0AmJ9ObRUOQn
	MUum4cx5oNPBeT/hiiXd+dQtdWZcPjx9fUWL8qWTbhxaAI0qQ9Tr5ezp0GzQfbkOjY5ZpdhBvMz
	V/O
X-Received: by 2002:a05:600c:34cb:b0:490:9d1b:f088 with SMTP id 5b1f17b1804b1-490c25ad8cdmr259622525e9.2.1780922150530;
        Mon, 08 Jun 2026 05:35:50 -0700 (PDT)
Received: from ?IPV6:2001:a61:1348:2c01:d2c3:7046:15b5:2977? ([2001:a61:1348:2c01:d2c3:7046:15b5:2977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39e024sm520155185e9.4.2026.06.08.05.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 05:35:50 -0700 (PDT)
Message-ID: <19190197-9f29-4337-8c8a-760b5aca7394@suse.com>
Date: Mon, 8 Jun 2026 14:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] core: usb: ratelimit cabling message
To: Michal Pecio <michal.pecio@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20260605090110.1514785-1-oneukum@suse.com>
 <20260605111731.4df19fd9.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260605111731.4df19fd9.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.26 11:17, Michal Pecio wrote:
  
> What causes hub_port_reset() to fail repeatedly enough for this
> to become a flood? Is there no bug to be fixed there?

The cable is really quite bad. We are retrying forever.
This message needs to be limited. Any other ideas?

	Regards
		Oliver

