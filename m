Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441334B8DE6
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785181; cv=none; b=bVNyZQYbabWdr1nv7iNGeTp5ngN/LrnJIftjOBz/bPCzilFtdN2E4b/Ln0hjdjMIHz4F+6sYfC9yC8/48+rt4peL0BX7Rh9wKfYo/8RJiOLQfleJGW42QCqCfI/cQth/lOEHvtd1NVEQZR+KazvCjw6h6KlwL18aOV9upvcPYJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785181; c=relaxed/simple;
	bh=ESaHfGeBqmjtrWwElJS3HH8vZOhI45PP1/GZBR7s6WA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQ+0ST5dnZYGLCHMFL5Jo6x5CKDpTHY+heEGRqzaBf2ux7LIxyMMiZWQRndf9W+RfyoRnSWIfEEIR4cuHfZ6ekKVN6X1D1hFJuo7JzOzrLx92VhPX3xn4nH7OzDuGGm7nnKR2JlOkCX9PxYIszMiu5IxQrGIFryRNu0tUTZvs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BNwwR5qx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BNwwR5qx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so34509815e9.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 05:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788785178; x=1789389978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sh4lMwtpk7NaSaE+W0IfcVg67gcAoopfexp/sEpTXq8=;
        b=BNwwR5qx4I/oybh7bVy3gaQHEr23aawl2fIhbO33D6kTg5JiN3fvhiYVpJ+m3b1Y1u
         ctWkVYsupgqKb0Zi17RYRAh8DQLpOLoKMgP83KL+cAiHhAk6zLYlnsNkCj0DiJL7g3vX
         an4WPx546v9IPw83d+fdSG88K6OSp9B9divqyP7aBRMB2oAb9Lj+vglNP+9hiRAmS/CH
         rq9tTvLUzRjk9MFs1xcubdoECImyqxwewnaT9B/PikWmCzdc+Qx+mPs5uopp8wnEGHWP
         wHxYj/AobwvWJGD2C+vGghgz09oNLCXz4u92v27ZfixDhe98kZISUZ3yIVgxK5mMRSt9
         Uugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785178; x=1789389978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sh4lMwtpk7NaSaE+W0IfcVg67gcAoopfexp/sEpTXq8=;
        b=deOGk248dIXc+E7ODsdmfZZQQbv7K8+eUpTA0DXd0BIZs2mQ8ciOCrpw6u+WCo5wmG
         XAujcudP2g0sGsaxpSTbG7rDc2sVVAYtcRoUEWFFoVXqszgVrmN4TVztI5/PZdUG4za1
         sdSwJRo+n+4h2cWg4YNQGTomf4WqzJUu2YMhEzAX34tf4U/BeeuLkCwckrEu1AkfW61k
         ft/gDMZKPS1PzjPyzOAut5+xMTsTizWEuVMqJvhlLjjY6KwQ9nBUxkpqqFkEc9LdhYOn
         JzdQLBX/Ewfc9VSr2g9qlC95T3pjtmWAjTmmmZLmnJTQQyScAQTOD8IjumdNzIF7oaZN
         mNaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz89wvku18nFBBtj56cTJeLt9RVSJg00KirT4weyfajAr4+9eFWLpynPE8hj4Q2sa/EDG4rx6I6CQs=@vger.kernel.org
X-Gm-Message-State: AFuF++msyZwJG7peV1DUEpB/TUvN6KgfwuiNZTyUoUl6gV6h9RSvTCZ+
	5k/CR/pbuI+SnXBUkCZuzAZf551SHsgoBwbgU9uLzeRqKAN7eh2LjQ2D7fhm9TCGjz4=
X-Gm-Gg: AYBFou3Fjt+ZI5O2Wp5s0pmo1gxx4WlQDj7XIXGg4mYiTva6JaE+OTeg6cPtYLl0rTW
	oFBtXx+QEPSkO2CLmqSLVAK8Lv+qPNmYm1CRkxbYFvT+pxfNgjZG6LnRGBvQ711G8EIwDlqbAiB
	94u8NcI4C1P/A8DBLoNvatCZyR4qsal6EsrByNck1FJ5hmEu5UsQZdY5P3ObbTMwq42V/kX2qrK
	TbQg0VeJi4QgaHSCaI7BCBFSXjBulQoP25Vuxh8G6e2dQtU0qSauSyX414hiOxoWMcYDDBlVKjz
	t6UlgcFaZj/iHKXgKRbSlhYubSuJqZAhh++zxdFFL8fezZu2L2OowzukJow8ughLtM8hRDE41B+
	CA934d5RS0ziO4K8mK9aBcnhNCF9Hr3Y07emGRRi2wE7LiNg5rzmMGLG+FcH9yhVXNRxSgusyve
	hGb4J/crLz8IcMe97mKi3rVrAAf7hD1piHxFyb+u1W6n0K1W0QMvOo3fotCd/JtqJvr4s4Hsr54
	qtEMz8Lh53tBv+XX+nX9hgNhic=
X-Received: by 2002:a05:600c:6214:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49cf825115bmr459195565e9.13.1788785178420;
        Mon, 07 Sep 2026 05:46:18 -0700 (PDT)
Received: from ?IPV6:2001:a61:1340:dc01:654b:3cf0:59cd:498? ([2001:a61:1340:dc01:654b:3cf0:59cd:498])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm282573745e9.3.2026.09.07.05.46.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:46:18 -0700 (PDT)
Message-ID: <f642f815-df4f-473b-aaa2-89153c08bc05@suse.com>
Date: Mon, 7 Sep 2026 14:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: fix racy TIOCMIWAIT implementation
To: Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260907065501.101013-1-johan@kernel.org>
 <e231a7e9-7aa9-40ea-8ac6-57855b4ac811@suse.com>
 <ap56NTVMq8GlbjmR@hovoldconsulting.com>
 <72615ee3-46eb-4639-a408-ba29c1235d08@suse.com>
 <ap6LcHWDvIWF3oNK@hovoldconsulting.com>
 <bc055887-3029-4740-bec5-7e2fe4205992@suse.com>
 <ap6iJ6vkVIaxXFwn@hovoldconsulting.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ap6iJ6vkVIaxXFwn@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.09.26 13:38, Johan Hovold wrote:
> On Mon, Sep 07, 2026 at 12:28:46PM +0200, Oliver Neukum wrote:
>>
>>
>> On 07.09.26 12:01, Johan Hovold wrote:
>>> On Mon, Sep 07, 2026 at 11:50:41AM +0200, Oliver Neukum wrote:

>> Yes, but user space can call TIOCGICOUNT multiple times in sequence
>> _without_ calling TIOCMIWAIT in between.
>> In that case the counters have to increase if a line changes, don't they?
>> For that to happen you need to handle a status change in the completion
>> handler.
> 
> Yes, the completion handler needs to handle the status change (i.e.
> compare new and previous status and increment the counters), but it
> shouldn't update any old *icount* structure.

We could do that and it would indeed be simpler.

But it would change the semantics so that past status changes
no longer show up in TIOCMIWAIT. Is that really a good idea?

	Regards
		Oliver

