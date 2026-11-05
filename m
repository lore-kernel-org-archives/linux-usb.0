Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883586;
	b=Arzxrji9jzd+HCcKIc/nfDuyltInZbUREEQYHosWVqlmx0wjln47JnQ4b1PXI9RU8yHK
	 ykvGqiy2HQWe1cd++DKngXfJMqSRKyV/5+kWvouu2S/u7qb9WCDXnKJs2xVDvQYcOjY8/
	 KXMROHB/txrUFOd0th11M5EZ4dk1iDcaq3BpmoRTjiYeZLd1GCjvzZLUk6xq2nSTlJEu7
	 70X1XnsbO+nWCODXl4Qhhx/uoj/DlwKoopBtVe92bQDFVsGt/u7p3SEG2p5SIIZiOaoT/
	 wR8xkTY/wQzfQJWaDLVgNZf6gqr/wHmSwglTZcTvcLChsX2Lvk6NtQQHSwGwvT4DZAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zGp3C/xUJkOHl4r8rRItOe/8T7PipyChAHtczKWxBfk=;
	b=WcEpSFGj7N1PntfGUI/g/bYSrjvJ4/7jotbq68CLFfO93XMoVRd6MJa8ecd1YFexRcIx
	 c0EMA2AfVZoG+EP4ARACADSfdmiiwvfBCSfNMTkwJBE59AoJgObX/vjfpu8AK211EOP7s
	 P8P9EfTLUQxxt4lUakDPqG52bPY8KmjtuiiYU9rh5NXqF5ia/uDCgMb+T8MkAmctJeiS9
	 ylC+0gwM7SOgnkCXfseuI+3BkNdK4nPm27+ZEGF1c+LTdBbEp9hDJiIog/q8H2V12h6QF
	 27YSTH0IyZ9Fvia6/LrYYer4JZJv9V7gJ+a5ruFT9M87bCJW036jF37uNbfLSAq4v6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B6priHhD;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93AA606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 12:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B93AA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B6priHhD
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so13049295e9.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793883584; x=1794488384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGp3C/xUJkOHl4r8rRItOe/8T7PipyChAHtczKWxBfk=;
        b=B6priHhD7K4wpOwKKP5Kp05NUiNy1Rz9LzmMFxPphtM5sxUSPJzLxoiqqN2KC2pDig
         fYCdgwK8M3sOhIs09j+wdJemr2gB6Xi9j9r586GyZoVGSP9MSTKkwiuGmmwAGQ0C7l46
         KMozb4+5EMc1BouQns+fs6MawOr91LQ+CQtwFFO3hMQv3j8LRWE7Yj8b2DMa+evSGclB
         oFRwIyJTyS5SDZm6xVYKWP1znLTT0tUuvDWC9okF7byQVOdrqE5lVH0lZpQE69Q6AJwN
         pFveOwtjYjYKDBHmK7HjgwfZWBYOrqgMQ+Bgm3wMtJFnQ48w+YkVZncXb6B5TJHY/TMa
         NXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883584; x=1794488384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGp3C/xUJkOHl4r8rRItOe/8T7PipyChAHtczKWxBfk=;
        b=TKTxnOFsQmHaWZtsDF4McWUqp0/RNRdpCXkUcAftWvz9feLFkUjyi8wDGBh2y+Xo6Y
         MojHxRvBG4lwsNs3TInSyiDqLtkQJNdroRXq/gDw+gEZFmElPMnoiTPSpztOu5TDzjR0
         P5tCfB9LKZrDsTMNfPeR+ut1GgIHR/WrTT7FSxBET6PwgXzWzw4plU9j5tqcqNV0Wvvm
         ODQJ4V0CFIvlf6RQE/o+R1xnnAl2228zYRJSHxZER2DQhhEM7s55CyRAVb4uTYDBoT2r
         +gh1HbGWBqYZzcsVfBiU65Z/lReo+yAKWbaqDNqtZw0B55o9rJIgPvCl9XAsshBZig2O
         JhMQ==
X-Gm-Message-State: APuU4Z/IFJMtBcQWw1S5q+lSy7dN43k3xPn9JS7U8UFPbG76V0sNw/qY
	Dbf9xwmooMJrLOgtf4RBg54iVHeemaBRxlg5qG18EMlyb0JHOcgpMnXCjd7itHwCNTiCIh5g3MC
	/k+AD
X-Gm-Gg: AYBFou2AKcRX9OMh+LC5c53nQJWk9v5Fek4XC0ixjPvzd/5kteRx/Y1yuPYCepcQeQh
	VIXWHbhwQkPf5Goze9g4phPI8WdEW3PYV/UVEDWOg2Q4CCjyiWSSBvfrro4zd+PoD2btLwArkDi
	Q7sl5jdy7X9mGQRFF81p02M1lZfF60dggp3j6SAOxjymmQGaHFc1U+Rxr1nb5T0YHHbMcZJ/Gr/
	5x9gzUl4aUTBtJwJ25yTZ4yIo6lZrf0ZG9/tMV9ODkBw+YGIXm6AEverBIXscfvJkXn+lHi3oPt
	wSWFC2R3HkNtS96Hu2RcFSe2jErhPVn17veqrGxMknSrvbtfqILFuElwJDd+MPq0nP9ncvCR1Tj
	aIjqwZ919RH4zIDVSzEF7nFMQysqFb+2ZfRGkFIZakgbAT/k7PKHZOkGTSfckSzKYG8TcjXz7Y3
	0K/ht1DbkRmwQVdLVFerQELkIhdjjgg16i1s8ijQMz1rPMyvMX5th6MRMn9wqpF8EWc+xDnW4zL
	2JXh4r5qlRgXzSEqIrYrruhtAtbnFU38pfAEyN5OROGSte7YWAeyoYwCR/SdAe+iwVLjx2SUCUD
	DY6eiUgz//LHW1WvxC66E3XqtfV9WliZFcWq5sUA2xrGTe/UgZMjgb6kD1ajEyOYWO49
X-Received: by 2002:a05:600c:348d:b0:4a1:fbf8:55c9 with SMTP id 5b1f17b1804b1-4ac19234acbmr389078085e9.33.1793883584162;
        Thu, 05 Nov 2026 04:59:44 -0800 (PST)
Received: from ?IPV6:2001:a61:1322:c01:9fdd:c901:f470:904c? ([2001:a61:1322:c01:9fdd:c901:f470:904c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm78239605e9.8.2026.11.05.04.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:59:43 -0800 (PST)
Message-ID: <8a63ab8f-53b9-4a96-9efc-000f762f04c0@suse.com>
Date: Thu, 5 Nov 2026 13:59:43 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC]alpha implementation of eh_abort_handler for UAS
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: linux-usb@vger.kernel.org
References: <e3eb3c84-ea19-4502-976e-eeb83e80a92c@suse.com>
 <20261105102303.3891933-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261105102303.3891933-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05.11.26 11:23, Jiayi Li wrote:

> Is that what you intended in both places? I'm testing a local version
> with these changes and will follow up with the results.
Yes, those changes are good. However, I sent you a newer version today.

	Regards
		Oliver

