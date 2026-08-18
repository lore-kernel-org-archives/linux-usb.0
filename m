Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6BF47ACD5;
	Tue, 18 Aug 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068987; cv=none; b=Y7wQt2NSluU3eRB4v+B31FADzIR5eM1b0Uo3+Cq9fjZns43JZka4wt0VE8kJhVcMrY1QMPhLltSdI75m/PYyzwpzjS5fh9X6Ixj5JNQRfshvj29F5WwFCngGJL1dqm8gytxGggn18antft8i0SLhEAIDG7dvN+SWZcogdjrk8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068987; c=relaxed/simple;
	bh=dXTg3sH2mPYTL0FKzf9A4H+CpuwD2Qm8ZyBQvziGWEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bepZxgRm1jXh0Ue3Zk3L+Ju1wRlDITcOBnPX0U/0ex6zSlq4cDPSIBHl4NPhFrPX6g5TlcGXjtofMo9EXpStceikYMxvZXuYChepfZTcDQiX2ffYQff+gdFz8zI4d3+qqndn//ixV9bau02OCIsrnU++bQBHIZX84uhSgqXxprc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DsUHDfqp; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DsUHDfqp"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hPZH91R3ZzMlMw;
	Tue, 18 Aug 2026 18:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787068981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMLEEusw3LBmYpCXCPyWTSqKB1/JwCcMpxn2G77wcIE=;
	b=DsUHDfqpLYsU6J1rJICx5xMO1JhN5FMNxvsl8N7SPbj4TTio/d4phYOeXWfG8LT+4CK46e
	1Arw/ggh1SLct6z5Ov9+kFUgKy5OXM3ZAb7Y7y1lu44h/y7LjCwKVx6Hrsa2dGspgX7el+
	UQU60nhevdqy8U5yIbndc3l6Yln5hjXgmO8/Zp//AUqp1mA7wy7VX9KmzhojuGyMHCw2XM
	VL5UuywNDsYNiXye5320b2rzO1isHOWlBbMSjcRl+VNEnqf/Wu9yZ3bwwJYpdIDWky/6Wa
	J4N2uuzSISLGnzj84xgv9cZHF0r7AkozFPoFfaevFbJaFOkR5UazG1f/+r1G0A==
Message-ID: <ae9bbbb7-0baa-4431-8a81-0b38a6228f10@mailbox.org>
Date: Tue, 18 Aug 2026 18:02:57 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260811051016.1655887-1-marek.vasut+renesas@mailbox.org>
 <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260817-uakari-of-mysterious-nirvana-a1d0da@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: huo58cjhr1mmu4hzneg6u5zbzt6gn11x
X-MBO-RS-ID: 07779ba3cd8c170a504

On 8/17/26 9:00 AM, Krzysztof Kozlowski wrote:

[...]

>> +  clocks:
>> +    maxItems: 1
>> +
>> +  dr_mode:
> 
> We don't accept properties with underscores, unless this is coming from
> existing schema but I do not see snps,dwc referenced in the binding.

As suggested later in this thread, ref: snps,dwc3-common.yaml makes this 
whole thing go away, so fixed in V4, thanks .

>> +    enum: [ host, otg, peripheral ]
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  maximum-speed:
> 
> Again, where is the property defined?

usb.yaml , which is pulled in via snps,dwc3-common.yaml in V4 and this 
is dropped.

>> +    enum: [ super-speed-plus, super-speed, high-speed ]
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
> 
> Why is this flexible?

The SoC has four controller instances, two instances only have USB 2.0 
PHY connected to them, and two have both USB 2.0 and USB 3.2 PHYs .

>> +  phy-names:
>> +    minItems: 1
>> +    items:
>> +      - const: usb2-phy
> 
> phy is redundant. Are you implementing completely new bindings which
> have nothing in common with all others?
No, and both phys and phy-names is dropped by pulling in 
snps,dwc3-common.yaml , thanks !
