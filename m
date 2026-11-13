Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582186;
	b=B5vA04bYRuHmsYRF982p46f7hit8VGmdsM8m1nRbk54J0OUQsJ2+BLLz/VYdtGxDhOBC
	 Yi2lCMMxVtuxVNDizOecHayqbdLkMOr8jcLna72ksctM9RjNK6Dt2XVMEcFK/iLFGV1Ua
	 +uJEEze8+2uOCilUBC51w9PB1XIpL9UK1kTMytCTRObJMMTW1P/14PbGZkQ5ehKefv4yn
	 zscJh+Sior1DaZZJ/1HeOJ+nJckGXbypOjWTtKrwQzKxYHCbfGeOYvTanW5AGh5xLNxZ7
	 Bo5XHGxobdsYIiYbtYu8TzA6zpIhuZFSBIAPkNJWbZw6VPnNSuQ4LSLp+7iDXGnKzpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
	b=1QhVzI0kyeNA4B4QGXDxP20SfYBl19ORyP7kpZit/olCj4BaCJxwRAEye0daMb6p3m8o
	 EYgMVXeu8BroWVnmq5oYoMDB1z9ns37hCCkpZE6g1UHsqiyUQ+VBqSr9M5QxTVXx5K4qt
	 LpVVkyPzAsxzPrUNiG4KFnWCxTqP4kL7r3fJ3YEskpSIvDVH+KKM6m3szfOpvkZxeQhhs
	 XvjBqmbpJjruAGiAJeE6qd1I/3JyLkZshmMmX3x32fh7Bd3jBvWwvnTQRP60byCdbFz+f
	 XbCKaCP3HNO0C/hbAAXO+xgmS9tAjHBgRyhi7HH0dtAO6URzRwAN7bDYeha+NCqONng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DmaorVqr;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9037606A88A
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 15:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9037606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DmaorVqr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so15493475e9.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794582184; x=1795186984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
        b=DmaorVqrPTMOVQ5U8Z4ZV9CLCYtOsQghBVhxjRZZypTvKdqe3/9BTAIM0++jsMVoso
         HL94qPhZ6o73tB99jYC6lRnai1gN85/OxOeeR3Lkg844jP2jHKTpgBrahU2QuMgqJM/+
         XltdROzgrWpbNnWbK2/6Os4GTRQEuCuSlxe6UD1NTKH1LhgkTW1ghwMu1GF8Q8qrJKxu
         9FHDPiS/HxyYfklx9p5B36W3I2P11LjAl867xXbhxpHKjzueI56yVCLSUcNwIHFDqfvw
         4J8ErN3cxdBuElgNhzfCnl8rrjiU4Z56vYCEc/otfDuUD3UYw/8na6FbuFHbVaDKWTQh
         LnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582184; x=1795186984;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ApDEwADNhJCY5oJfw9LvJYizZp6J2xCMR2plrHsNnic=;
        b=j6XtvZHT88JLwVl/YiTpRjgPjsFmpulzY82mWQ+K0YVIhVFHCVDqQo2ujOPx6eMQ6F
         JMNzIEDm07fP9rysnKpaQVzUMQ9ACSAgJPgmFRQVYTyTbWtaCjcBtHIgBxK7uWJJ7o1Y
         xezdMEOeDm4jF2DFtmqcKt60zt3v0mSWWa9ypuWPtgNL0U+++TdzoG7eE30ZPwhnPUff
         CKOygx7Pd377jVVWn0YXTGuaw7GjDDIPptXs+4IyFpYW5nLqtaykw9WcEhNsUUs070gE
         IrcIRQIvHYmG4NjVcrquN/35UU+2BsNWj/KX2byfVTjf+Tm/b6+pO22cfXpcyODfXqRu
         gTpQ==
X-Forwarded-Encrypted: i=1; AL+hErFf+kXV0zDG3/+hLbuu1k/VmTm/tGL7ui/6eXJ2gtXo9Dpeb26raRfOBCHeY9WsdcPE26ZvGUhAeKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hLRl5bWmaLEtVWCRc7Wts9tzeng3o2O/sN75ujOagBO8fnfan
	wLtNjaE4r/kvDz48hc8YJohp07P8inj3+JKIuIlnq8aPYM0w6bwZrVuMDlJdseIkUbUKQipGuEY
	R8/7o
X-Gm-Gg: AYBFou1WQQAKl/Cr4YmqtVSFUWotRAqTx2mX6GDDDCO/31kuJGy8J5KgrL4XDHPGaIV
	CIGCLsV1qGt4pZ/9OmIK8CzifyS/mgoVidzGD9S16Srj5pJN9awSkKaBNlVcZq401tQ/R6030aj
	OIrzSagDjKfDPHnCWMQ+zT4dOnNpz4A5WqhR+eYaERCb978jTqJuCqcUcccmQk9CzIfqctyIMnM
	GqxiPIfpdgDrqLki8p9+W30GaKBQS/fV/EGsWm0b0svKDfn8Jimqtsi7ZOroLN7acS4tq6rrlW5
	xY6TsdVN9tYd/jjq8zotUsLMTy3gOG4mZDVzmr6sBRq0HXjxA4znVOmKpgYEp0ergvETTd7mEE5
	5OXGWoP3yUA0MXUE4u9U+G0IbLrFA6rYCR6BgBzX4r5c9p3FQ1cfASAkd1ABKhZfgV2e58Y94Pp
	AD/77iKOddhaanG0Ky0QiazgmPbpdIN7oZmjgznUS2PyWEKamW8v1ReGXebFMB3oPR7GmntLD5t
	U9pa5lCVjdkHDvDprQ57QFpSdIUmicw23OjC6HCC1Jky/nRe4fYkw4r5w5K4fA5hkTDX+LGfAKq
	OAUd1/PtPGcuoWiIWg4x+lFYY2NUc7F3NUCFTaI=
X-Received: by 2002:a05:600c:8b76:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4bb55a01a31mr55189845e9.4.1794582183857;
        Fri, 13 Nov 2026 07:03:03 -0800 (PST)
Received: from [192.168.0.167] ([51.37.10.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm29719315e9.4.2026.11.13.07.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:03:03 -0800 (PST)
Message-ID: <4edafbdf-d0ee-473a-8f11-92be44877583@linaro.org>
Date: Fri, 13 Nov 2026 15:03:01 +0000
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
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after
 regulator lookup
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: heikki.krogerus@linux.intel.com, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 02:18, Xiangwu Lai wrote:
> pmic_typec_port_probe() looks up the "connector" child node with
> device_get_named_child_node(), which takes a reference on the
> returned fwnode.  The node is only used for the VBUS regulator lookup
> from the connector node and the reference is never dropped, so every
> probe leaks one fwnode reference.
> 
> Release the reference right after the regulator lookup, mirroring
> the parent driver which already manages its own reference on the
> same node.
> 
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
