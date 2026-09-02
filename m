Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B057396585
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341750; cv=none; b=hbXDILI0dFMJ8w3F5YhFLusj+JPir1A3segCI4OB/eJbUfeq6LFu7MJzTWH15SR6tzj4trJuNCnwjjARP05P3/EyXlhon6fxqmfLZ/7mWVaJxLSk01qWSfpSz5vQTtzdB1Sk0xchItEHexA2mSD+6See3wb0eaGJC0oA14jiQlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341750; c=relaxed/simple;
	bh=iNo/X1HOk6SUJNcB6uVnTG8Bp5qsoZbcjIchia2Kcjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDBrptG1eD+oRkPFOrrO4/OUDXD1k/Xkzu/zWC+KmDL7O45abEN1/PArjij7s4AwC0EgjL7JeGXyYL6On3niEV0/05CsqdNNUIDLoDsaaMBlLUJGw6c8bFMcJG+H0NOVYWbPQPjT/UrSc2LJrSLFfPWxu4YkH3ciNynurCCDCJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EOge15Mv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EOge15Mv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so8138625e9.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788341747; x=1788946547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/LlQ50v0hB0ogjsIKinQ4rbE52J+HgLlzftTVo1r9Y=;
        b=EOge15MvTgAdmNeo5esCajAp5M+aMEbtJqSU5hbPO9rHke413eR6pdyNv/qbL8l9o3
         AgJAwUhc17GP00J12qc9CjHZKyRpefUy5yXFasf0lh72ede3V65JIt9ecSywXH0aD+5m
         uwVvtxKZSfgvTPRnWSpnRgsdP73l+RoN/pm9xd/b6YAE3YyjBv96AroHLCAxxnvwD5Xq
         2KUgEZtm/lewFcrIpBlQehHECFkP4uczquBxqpHt2if1BFjuhkGjh+MVS4nwyFY6Pv4x
         zKlri44BlAJtaW8HIvImMEgq1CyLyRP4KJyuGNI3iKsfQosYhB0etVQbqHKHP4KZ+m9/
         Oopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341747; x=1788946547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/LlQ50v0hB0ogjsIKinQ4rbE52J+HgLlzftTVo1r9Y=;
        b=f1+vsEdiYgPjuxBK7hSZMY8ObwqbFpJRoS6UazqPW0bhZJW+uRa7t5hYKbF8rienVg
         MTfWcmVFJOpm3Io4ZQfvcicyC5sSM3+lFOjhqPLgzEXLzXdQg9p5GniXdu7bl37T38Kv
         9O/+cEmgVJKnuC342ipAYe5e1qCFvxZyhAvKR0DOFzlx3GQcWIMeigU0bMSxj/vHG/u/
         Oqugok1uhpYTM5mXj92nKpAyO8H2Vt1saWVKSRsgpRxHIEbW0hY51hm6NIk0YjKRE0uv
         59kKyF0Huatjgq2MIMYneQDJYl8a7NIjERZlWBrBG7gAmQ3DWNTKvSF5hvNr1YntnNh/
         tfNg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/TKOhB2tQRhnUYYeT3woyui3KtQZ4jXj0ttmqLT7LLYr6lfNQ/3+xNlpfvFdz7w42WhYNaqFHZP0=@vger.kernel.org
X-Gm-Message-State: AFuF++nG+9ZgSV2O1CgxzUcN4GjkGKsuyAP/yC2wPV39zldLKSKDZn7j
	Cs0xaMq0QRQKNUyOpvG4tbURY/XC/XdkB9ca2sBbKlpIsUAn0v0q6RrgW4c/J4gsSyb0kUSDvCj
	FNpmH
X-Gm-Gg: AR+sD10uLTdGJ1B93yltJ3jB8NjLfGN+Pti3pscCR+ozLGENHXMMptcVNdXDeK0ljuh
	rIPypUOAf8bqqdyiPzv9/N1fnDaBdAU0VNCY1y2j6BEocrnXjIBo7+Tcz1qOO9RH0nt0qr29ZW1
	A3GN4fOVARz/Uhf+NruKfkwfHQtNCDlwzmea9h30bN/DVTCgIIPwrp4PJndbnh/mrHo8zxye3Zr
	Ks7/3GDrZfB7dYpmmaEAPHTFP1mEL6wGRY+njqgC0WAqIkUAuc8ggHPLxlyxCQLocxQfMeIc59+
	QgxIzHxNpqvxJmXkc+JeWBAFbW2IH9M7Dik9DMldutcOFOFdHoY7gw8Wzv//iO37QBHTIpg5mS7
	Qs8xHQA1HSNkhg8sEId3SJ9N+no39roKqsqxc54zsk2ynnBWuC9LsHe3vXFYesU2IoWX4JuFNcN
	x59bjG2SKI7zYHZKOQVSvjmZn3UgUiWS9ArKjNayZ0JoZwiWwPYO3wj4sjHWNf0lK++oJ5TSGq0
	SyfEUzLtPbyNgVfin0i0bWHnMfjuLJLlt0asR/n
X-Received: by 2002:a05:600c:45c4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49ce5816186mr58880035e9.10.1788341747117;
        Wed, 02 Sep 2026 02:35:47 -0700 (PDT)
Received: from ?IPV6:2001:a61:1304:a201:f0d3:bdff:55cd:3f16? ([2001:a61:1304:a201:f0d3:bdff:55cd:3f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b401sm134005545e9.3.2026.09.02.02.35.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 02:35:46 -0700 (PDT)
Message-ID: <be2bbb52-617e-4b9a-b8a1-ed5c2faf81e0@suse.com>
Date: Wed, 2 Sep 2026 11:35:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: image: mdc800: change kmalloc() to kzalloc()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260819-usb_misc_random-v1-1-43a0dcee3a32@kroah.com>
 <0ff47679-3f00-4cb4-b1ee-2b3a0e15b13a@suse.com>
 <2026090159-aspire-vanquish-da99@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026090159-aspire-vanquish-da99@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01.09.26 16:30, Greg Kroah-Hartman wrote:

> With old hardware like this, let's just stick to this "obviously
> correct" patch, and if someone with the hardware ever shows up, we can
> then test short message information like this.  As-is, this prevents a
> simple "leak kernel memory to userspace with a hand-crafted-device" bug.

You are not wrong, but if I put on my security person hat I cannot
ignore that we are still leaking information among users. That is
the obvious fixes would be memsets in open(), not in init()

	Regards
		Oliver

