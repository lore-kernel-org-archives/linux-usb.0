Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610727;
	b=fhBa3oubd4srLbCe+GK6aqtxO1HYn3Po9HY70XJtYIQYqgn35kMn1DJ+mnDJL0yuixqq
	 UVgl/mM5Kcnj6T6ktZjF8o//EI0SxS7H4f8sr+iu5eJFfq1ekUPneFTBQ6Hl1fYOSoe0U
	 POS20SiR+TZhog5nIC62oHjUkU4/QfZ6PxIAYeuxNCcJzNFdEtc43rXW9EFixcu0OtUFB
	 bustMzhYyxt2LgIlxSBCqRLhRAf3nejoqm1/w/tlI0JazVddkqNp6DvuwagO5I//qpuwT
	 6aMV43A3sES3lFei4CsREfBvlgJSh/kVVPi+vDCB3JmTrWLjOsdgVRJcb0+d0D6gr2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610727;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sCjAgyMnhswvdll1WI7G+lYMBY2LPxqitr5w0wFs1t4=;
	b=TSLbQQc/w8yUw8OEZMK91UBU7OhrGb5l+vN2gPE9R9WmGtwmp82tNB9ux3HbNwIqxlUu
	 MXI8jcKxNfc2cCTnBWgPbJXMV8PvFAhHu3mOAp1aeSXaGJrMTRSdC64LvUteBs5r7X4gd
	 g28g1zDqwbpjpgxNBR1YqGxrxg5c196d/jY4qe7a4urPExbRC6WbQYcVKZvzWhimmawHT
	 WqG4DN4kNTCfXH6oRJrTx4v7VV7qP+IxhvvD77f/rdtGb1/8BD6TSerwBsWzr3U/KHvtn
	 WB5p9L0sJYWYs+DJJfoVup7UoFRohXSWzwZOOmJxFTws/c6rMoT9QH9KGzOmVMmKfRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J8zactmE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D07C606A31E
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J8zactmE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9498B1F000D4;
	Wed, 25 Nov 2026 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610726;
	bh=sCjAgyMnhswvdll1WI7G+lYMBY2LPxqitr5w0wFs1t4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=J8zactmEeHh4De+oF6lrjC0W+2KdgITyM/0Zyv1kwPrLAL9zjbnTDTqXlWxPaKhr8
	 RlqFhDYlA2duRq0IdueRHWN2xtrbik71qSthJniAbf573wXo5GHjgjmVmpS3VsEb3L
	 jwY1zO7HL8hT2ym50BP710Qs6xXMOUFJiysrzMSvWwhiG/vupIVxQnXFa3DLp46CPZ
	 yACi83gpv1LXV9FrQPwLR/wNCdWKjoHnkcXebFd7gnH+VexiYw+qa2swLbWptXhdyE
	 xzCJQGJQoaNKbfbKXP3JRokxsh8COEeUdPlV0IYA6TjAjaITJ0iCjpmdFuXI2zeSrO
	 rG/hmpcmxkMXA==
Message-ID: <3ad99ab6-998f-41c6-a103-739697c3f786@kernel.org>
Date: Wed, 25 Nov 2026 13:45:23 +0100
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
Subject: Re: [PATCH] MAINTAINERS: Add entry for the TI USB PD controller
 driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20261125103815.299916-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261125103815.299916-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25.11.26 11:38, Heikki Krogerus wrote:
> Sven kindly agreed to keep an eye on this driver.
> 
> Cc: Sven Peter <sven@kernel.org>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

Acked-by: Sven Peter <sven@kernel.org>


Best,


Sven

