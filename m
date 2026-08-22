Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D9339DBD0;
	Sat, 22 Aug 2026 07:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385400; cv=none; b=OaHnPcNj2DFpe7jWChZvzpxs2PbR72ateKdwFnimzZtG/sGq1+uS+DbOYECIIc29txQ84h8a7j2XbR/IjGKjN33utVDqIVnUN56p8eGCrmaVZig0CNRGd3qHJBMqasHAvitBHXW6RzaWWlWhV6FW6jGt3AxVj8jRUZncy03Dv20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385400; c=relaxed/simple;
	bh=WsFnlg4/CTuCJRq0QbupnXzJgfkH1Sydo3piWrjffmM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JuG0QPPDLG26ktMjkXMaoKSZWfRdBeoDz3jwS6oSDjQfMi2y7SgS4wibHtXq3p1LTafNw1RWtYvTkToBxFw+rW1XUizyzpKY1Dc6kHO152wRG7drOaP1J544d70Ztosk37K/lL6NFCVNS94I9HxcPjX8XvSKUCy7eXB05CHs4cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=A//luhdo; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="A//luhdo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 188A611C824;
	Sat, 22 Aug 2026 09:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787385391;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zT4ZfaeeW+xDfLKh1vH6ykikxBYlIkfGuYnlJdpbz6Q=;
	b=A//luhdogAjSYjMVwX87YwUv29JcAAwGxvKY2UWLDydr+E4gK62XFHe4re2rrfIasUebo6
	XQ4R2bHaiDNiS/Pn/2EPtBcWquGqkB7/8LYYtSbWJmWvR5X/boRRTZ/t5QV9kMeKN/jXjC
	cFJ6CLNaS0DVAzaBvyojmqhhYTF27IbsOSe+kBw0FWcmKS5XDKxChXz5cA+ab1dKScaDkL
	tt6QLtLbMjUri8j9w8sLHD8O+bCNIi3svcUPdtMGyZthWTOFHfIeX/jWCgV2hw0Zb9UbNj
	4xSX5q2XqMzu8ecYGPO8BILvWm1qA2Z+BMLg7iNKY9oRZJYHJ3tAp2PaGfUuQQ==
Message-ID: <225f1704-399d-47d0-8bca-73a27a59bbd4@nabladev.com>
Date: Sat, 22 Aug 2026 06:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260819163410.119755-1-marex@nabladev.com>
 <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
Content-Language: en-US
In-Reply-To: <db62c29a-7260-4e19-9279-e38323353c30@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/21/26 6:27 PM, Fabrice Gasnier wrote:
> On 8/19/26 18:33, Marek Vasut wrote:
>> Document ST UCPD Type-C block. The UCPD integrates the physical
>> layer of the Power Delivery (PD), with CC signaling method, for
>> operation with Type-C cables. Vbus and Vconn control is performed
>> using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
> 
> Hi Marek, All,
> 
> I've sent a series for the complete case. Please check and review here:
> https://lore.kernel.org/linux-usb/20260821-ucpd-host-fusb340-v7-2-rfc-v1-0-c5e27cbc0795@foss.st.com/

What is the difference between this driver and the ^ driver ?

Why is this driver not covering "the complete case" , what is missing 
here and not missing there ?
