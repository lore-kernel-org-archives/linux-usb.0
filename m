Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A524C37E5EA
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 03:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.88.97.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430692; cv=none; b=sNbWyT0OCowsDgKRFz1DbgOMdGGvscZ8XeTWVrE0Jyg/zQH+Zxu1iIFcUAAhIXMSKKswUN7AT9VFKN6yXVzBMXhJuK0U4Uql3jl0a81Z2G0XWttBaqvsJm9SXvaB68Pm+4XTiVjG8r89MeSAjHIwtvEtMq2YrIoK2rSGC+aq04s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430692; c=relaxed/simple;
	bh=KMcT8IeRTce6dIccqSGIYdChY1w8D47+5gxsUg2mD+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqMhwa7E2CH4oTaoYUPdghUvf2Q7re4zXjWOw6rWn/QILVFCn2rfmMHSetU1wUu5cKzO6fohFi2FoDDRqmSO7Zpy/ChLrcBY6Jzx2McSQqzItfAjSHn2r40g/g/v9L1pWJkdpKOvw2VYerpJmwqDjqG9xoD42CCTVzpaNOvg2W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de; spf=pass smtp.mailfrom=birger-koblitz.de; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=oUEiqjbJ; dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b=oUEiqjbJ; arc=none smtp.client-ip=23.88.97.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="oUEiqjbJ";
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.b="oUEiqjbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430687;
	bh=KMcT8IeRTce6dIccqSGIYdChY1w8D47+5gxsUg2mD+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oUEiqjbJGFlHzfLKqKZmNPOiEGNQE5r/Gbwde6kG0fQTQ4C05YAMakXq6E5x5o6VS
	 5I8yq30rNPhUEoF99CYIwR6X9pT2Yy/ihtAI3l/DCA6He3RU9MDywhb1e0TeyS/EJY
	 p82Hp0PdSGx9EoDy8iXyLvxtecsvmrw8WfA8PgsY4CuRKc7jfovVsg8S6+eyowzLyH
	 oSzFFTprFz8koQU4vTlNtyBaYpzChzZx4CRxh1mD8MVT5ewv3TT8q7HBKOKtLwJJd4
	 FMi9Y66uFSeKt685ghbAH0fS5hBFYrz/WVahV16Pj3Hh5KeMDQrRt/ks7PSKexOQLs
	 J2+evYMr4UwpA==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 7F968470CF; Thu,  8 Oct 2026 03:38:07 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1791430687;
	bh=KMcT8IeRTce6dIccqSGIYdChY1w8D47+5gxsUg2mD+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oUEiqjbJGFlHzfLKqKZmNPOiEGNQE5r/Gbwde6kG0fQTQ4C05YAMakXq6E5x5o6VS
	 5I8yq30rNPhUEoF99CYIwR6X9pT2Yy/ihtAI3l/DCA6He3RU9MDywhb1e0TeyS/EJY
	 p82Hp0PdSGx9EoDy8iXyLvxtecsvmrw8WfA8PgsY4CuRKc7jfovVsg8S6+eyowzLyH
	 oSzFFTprFz8koQU4vTlNtyBaYpzChzZx4CRxh1mD8MVT5ewv3TT8q7HBKOKtLwJJd4
	 FMi9Y66uFSeKt685ghbAH0fS5hBFYrz/WVahV16Pj3Hh5KeMDQrRt/ks7PSKexOQLs
	 J2+evYMr4UwpA==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 23FB341186;
	Thu,  8 Oct 2026 03:38:07 +0000 (UTC)
Message-ID: <f0eac20b-2d52-4fb2-8065-54d692d1c758@birger-koblitz.de>
Date: Thu, 8 Oct 2026 05:38:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 03/13] ax88179_178a: Split driver into
 library and device specific code
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
References: <20261006-ax88179a-v17-0-252814fe35ea@birger-koblitz.de>
 <20261006-ax88179a-v17-3-252814fe35ea@birger-koblitz.de>
 <sashiko-outbox-162603@kernel.org>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-162603@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2026 5:05 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: deadlock in ax88179_change_mtu() due to recursive rtnl_lock()
> --
>
Will fix by using dedicated mutex: medium_status_mutex

