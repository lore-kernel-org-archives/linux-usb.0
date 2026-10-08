Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8504B37C931
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431310; cv=none; b=jRdxM8F6edxTbXyjQLG3qlN9BYv4y6xqyt55Na4NnJPiuI4RO6CMPQLTFtlKHcnQWl0LcaiJ5Obp+ucGPfxngH1Q3wLIjwGLx/sT9mOe34NFje0KzZc9gwbN2EuEUSOcmiLF0YDCxJYyIcmw/vjRU+hZj6WX99ptNLNGbsBlHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431310; c=relaxed/simple;
	bh=F+j99mP+By7y52vFCReFDj/L7Y7YLSbpAGczvCAqwUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcxsHukFKL2kgsZow24t+mPTNKUU+kSQS/MQECJe7Q1Qu/soRwzZmukqpQSB5gQqi8YO57G7JsKYW7UbFp8k90lPA3mSLydqp6HmfY0YXAXLcaKvDx4pPph2dvNJFN1YPbv6yhYLwER2PnXzqscxKFTdnF42D8J0CTmTYryFreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=dEFokS9e; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=dEFokS9e; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="dEFokS9e";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="dEFokS9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431307;
	bh=F+j99mP+By7y52vFCReFDj/L7Y7YLSbpAGczvCAqwUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dEFokS9ebBafoA7YfAYqRGwVi2iqSdoXTBd1Dv2Kgpw+Q80lU2QUJOT3YPhsQcmvW
	 GfryIrsitEjOHR/yibwKqKPNEyFgMThSQ5l/VhxnTl/365fewag8ZyF3P+dfOIxhF+
	 jgw9HOr5BkoH3RqdcoiiYG1396LqHEuXWT376a0c0a5MRFTpujtnMkm6Fr85v30roa
	 GmnYE9rLiXzXoAW9oDkwLwan4xtY2i4PbmlQRwAN7vT/nTE2I9rbAaJJLiufe+t3uq
	 zF27xh3yQRB1Y5jcKZdfv4rWnesF/gvgVqui1fbkzTNdJ81jYaRwltDUqyI5tAh1Ky
	 hsgPlzPkqdU9A==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id EC939470D0; Thu,  8 Oct 2026 03:48:27 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791431307;
	bh=F+j99mP+By7y52vFCReFDj/L7Y7YLSbpAGczvCAqwUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dEFokS9ebBafoA7YfAYqRGwVi2iqSdoXTBd1Dv2Kgpw+Q80lU2QUJOT3YPhsQcmvW
	 GfryIrsitEjOHR/yibwKqKPNEyFgMThSQ5l/VhxnTl/365fewag8ZyF3P+dfOIxhF+
	 jgw9HOr5BkoH3RqdcoiiYG1396LqHEuXWT376a0c0a5MRFTpujtnMkm6Fr85v30roa
	 GmnYE9rLiXzXoAW9oDkwLwan4xtY2i4PbmlQRwAN7vT/nTE2I9rbAaJJLiufe+t3uq
	 zF27xh3yQRB1Y5jcKZdfv4rWnesF/gvgVqui1fbkzTNdJ81jYaRwltDUqyI5tAh1Ky
	 hsgPlzPkqdU9A==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 3D15541186;
	Thu,  8 Oct 2026 03:48:27 +0000 (UTC)
Message-ID: <7caa481a-581b-4806-9706-16d931183d4e@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:48:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 11/13] ax88179_178a: Update driver name and
 information
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-11-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162609@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162609@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: skb data corruption in ax88179a_tx_fixup due to missing skb_cloned check
> - [High] pm: leaked pm_mode state in ax88179a_suspend error path
> --

Both issues are duplicates and have been fixed in previous patches

Birger
