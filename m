Received: from smtpfallback04.a1.net (smtpfallback04.a1.net [194.48.128.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23B38DD3
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 03:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.48.128.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565374; cv=none; b=YLjxfIKs2djoymcLp9KRqyJ97+EcpyFD+DLEDbP+LGQv2nTlpZNpwyCnYOqk0XBU+X6qzZLvXSHn7GsFMC8TZUeXpgi7slaV+Pm/yl5i2PiNF4i0w0Y+G6209fcW0Y6uupyzIhWa3pmWNrC6h1jgjeFafsjYO3U3sOnkjJ3HhhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565374; c=relaxed/simple;
	bh=T7sfTCE0U1QAed+gPelXGuNjT6SBTED6v/Qia41aU/0=;
	h=Subject:References:To:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=Z3EZ4Q/IAGARf4j58JmbvuIi2ElcoGEnqHiYXSqCN5RWSHHMPt7kYyKJFpZOeNwTE93FjDFryIZ+ivu1vYo8QLe/qGpJTQt4Wd1ofjqfE1EGC4LhJh1g2sfN8B0VttJpnCLAgpE9p8G2fGcgT9T6Ck+6Za8NDM8ggX6N49qpzLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net; spf=pass smtp.mailfrom=a1.net; dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b=qcRoJfU2; arc=none smtp.client-ip=194.48.128.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=a1.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a1.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=a1.net header.i=@a1.net header.b="qcRoJfU2"
Received: from smtpout06.a1.net (unknown [10.247.84.32])
	by smtpfallback04.a1.net (Postfix) with ESMTPS id 4htRKH6fnzzYktc8
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 05:16:03 +0200 (CEST)
Received: from [192.168.0.6] (unknown [100.70.236.76])
	by smtpout06.a1.net (Postfix) with ESMTPSA id 4htRK626RNzGrqnn
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 05:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a1.net; s=resmail1;
	t=1790565354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMv588N3a+z6xhOKPqL4xUxUo54UyKKCnzRMv7+vlFA=;
	b=qcRoJfU2xXdEyr/JjpPAzmRJ2hjmO3qpuA4CuKFKSYkWPLYvyHgQvDW8hvwSZYrKEoCTO+
	oX2Z1fYVEYSX0Gj5ssr/G4Qvave95z0MKIv080diV8WNmuwKlicxPd1oOVC9QrOMcmkoXh
	ilGnTuXCGmds21Sljo4BA7m0nuUg3p8zno1ZDr300t6lSSvK/Qc3HmJix7LRLMBYouPDgO
	p0GUmzpWMdMeTmOaEwVjfDUbJEEqS0NCK2cNhhsWjnnZo10CcnpRYsXIqLVpJxnOk3yF2Y
	4GJR/C8/m/iRRP/tDO846kAgvtEIUlcSLuAXmgtQk/QzhOblb1+90FwgHAaEpPZ83j6vA6
	SUR1xo/rgzgVxxAZiBxHcN0ouu3xQh2ILsZrKql0Q+3pNasgFIr+NC0cClNGPXj2zt1jmM
	SmgSts2aiSuaHRVjYYUTFBWZ0T645NFjRkEH0XPzw/pD06Xgg4RPOT7tTzO7Bt5DJtkSG8
	jB0k2eIchsRO013hux8SnMv7NqN60mWfK78hTbdCVjwsPzxlLqEf9Yenu6Xm/3nn1A+Dor
	PDPL2pI5Pp/q2MfxtsFhMvIn/4oNL4yfHoKZfhphQYLe9nLb3CZxvhhOZ5/pOPnaGp/UhA
	KOrXUEB7G7/uWgiPD6ArYLVbGjkz8PAZ5JsgQy7u9J7uuXZur2fFw=
Subject: Re: possible regression in usb-storage?
References: <d0cd9a1e-cdb4-97c2-5bcd-1bc9f5d9173c@a1.net>
 <5ab3e86c-f209-ca72-58e7-8ea56225775b@a1.net>
 <f66b21bd-707b-4503-a40d-972832db130f@rowland.harvard.edu>
 <605c0845-cfd4-0702-4322-53d9c8037b70@a1.net>
 <be5899e3-3e3e-4977-e4aa-32ca368f06cd@a1.net>
 <7e2440cb-41aa-3429-fb6f-b0f4cf761029@a1.net>
 <986f81b9-c195-4ef4-8176-ca69a8f506c4@rowland.harvard.edu>
 <04f165bc-e79e-4ef4-1f22-d4ad086c3ffb@a1.net>
 <0a83299e-c9db-46fb-a4ee-85b4e861f5d4@rowland.harvard.edu>
 <bc169809-3fa0-0a8f-911b-909ad2f8d46f@a1.net>
 <ed5b68f1-2875-4d2a-97a2-ddb075a562e0@rowland.harvard.edu>
To: linux-usb@vger.kernel.org
From: Johann Klammer <klammerj@a1.net>
Message-ID: <3ddebde5-c69b-8676-e022-03a87f2c2965@a1.net>
Date: Mon, 28 Sep 2026 05:15:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ed5b68f1-2875-4d2a-97a2-ddb075a562e0@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Level: 



On 9/28/26 3:22 AM, Alan Stern wrote:
> 
> Regardless, simply unplugging a drive while it is mounted isn't a good
> idea; it can lead to data loss.
> 
> Alan Stern
> 

I had it unmounted, and (to my knowledge) there are no automounters running.

