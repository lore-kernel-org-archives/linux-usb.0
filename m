Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3143E7BC6
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402051; cv=none; b=cRqaz5/vWa9pPt/bPTaVnZwQi1EtIfSyes1i8FUivF2NuU8iJnj2WhZh83qAaOXpEsVUol9R/UjfZNBFbq4XHRz7ef3Cow0rySWWiPPXxIYnuO7Kcy73vJ5m5vyIJZUrdphkoT+M+6qWZFMVgfFLTAQpOnr6GShKIGJg9LOapUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402051; c=relaxed/simple;
	bh=xcZmHyG+PyHzYnI3+XgZ/pF1qAMwzINMPPYcsiRQc+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwUvjGlFN2NbDQEwuCPg4Mxn6ysXl6WlntPzqkJ8tSCefBAOPCW8WJZRoe7TVSASQGRaMYStCDkXHhN4oSBRDUrFZAqha+gXd+3L3AqQOOw3J6qVgmbeYAhjfXyClgIf7C0gCGfGDRz4jr834tosor4N/W0ZmHrDF1glBLEM9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YrWN0t3s; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YrWN0t3s"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb769ca17so25899231cf.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789402048; x=1790006848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JOjpLjBtfnP2SB+Px5CSsqFZEkc+Xu2rctfSBKsfLPM=;
        b=YrWN0t3sT1ci6hyCr3+AzDTZ1ucRhRQ+wO3+C/VVtAaEiIekI+eH8e8m2NrYUO81VE
         GasybH1PuOlMIeY7HFrnVLDh2YUwGL39CyEU34cwktthK01bR6+FIksZlkddIeFfNjhr
         iN2IrhfXBHsIdQJ4/VxcpEdLB+I/WDI8pDH/dysIGr8pK/BslITJAEB6ppFGDmuYWM7X
         WQU67g8h3ZFKHgSOTrWyK3FbC2lGtxwgPV2xifIhuRxok0Fw3Inu8FtEJRk50Ro+CQc/
         l76TaLp874POFFWkl52xIgFigQtBujDykI0i4F0rAckxH6iguV8XqBpVjvkMqq2XDFt+
         AJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789402048; x=1790006848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOjpLjBtfnP2SB+Px5CSsqFZEkc+Xu2rctfSBKsfLPM=;
        b=XXfcvORs/Cjgd0QwWAMVndBcmGM+LxbZl+g7B/FHHXi4HYS1ISNowCuQDO7Ym041zQ
         nwmejyDxG9jSIpyZ8pOWfnIaBwmKtrqXK/rnl9meHqMcT3AD5Waqz67DNrOidwlc3ang
         iYhrVSg85SrnVl6A9nD/t+SrlDZHG/NZcaSGHidtlfKakGVW+ujtbfaR3mc4A3Se1ZVg
         tt/viuDI0NHKqJmlOuA8BJVr6VqWQ+JFDAkaPHjPuaY3ecgwmGNcNQiUQuRInu23UyJQ
         xgp3TntZMPCHuSeYZgzwDwwFrb8WFO5OSKy+xdTUh1muJdeLvGwFkGGrXjgZLzcGaI8g
         sXEw==
X-Forwarded-Encrypted: i=1; AKwUvBzDt9VWMNCo5C22Tu7DwEq9inoxYhIYxw/qRJ3c25xrTYhdVC100cqPwgtaQlBAe1OQpZF7VswSBNk=@vger.kernel.org
X-Gm-Message-State: AFuF++kSB2s5A65G8pAnWdrTaA0H5Zp7YU2rIkWhu8yrAUThtTTeEoz2
	cgMKHb/iJLGc4GAB5eWqoB2PHBacwF7tdKN2iMYMnk0HUWe2MB2XPcX3iCRaT2jXR8Uwr40fE54
	wB6dPwg==
X-Gm-Gg: AYBFou3tqVyeVXrAiaK3/OxNtZ1n3ySXe/4Q8y8PWpwUd7kScOTb7LleStZgfj9uCVJ
	K44bvEPyWzKesUbUkoOqxZKaXgkkok+4RRLDZ6iwJN5kBJTmkloEXpSbHVXyu4Nq5x+eiYrLRtO
	v1rhohyjtcZUdW9ExO4If08XASwaBafOzjJTx9NML00yHAlUg0iY+tS9ztjsAG0bsCBpiif4Fzz
	0/WcUb5ORIDqKenm9j2H1pg/Yx4J8V/80egXo1fYw85DaTcJpOHVoVGmSH0/jYHMYVGH9llTMLT
	mXEt3Aoq9IP4BAKhk3V6eQv1vDYCEl6161YuvUEoC46I+fTKDvERVWPKP44x+AWcT7Q7QzG4nsz
	1vfKZPN36tND6wyC1+VY9Qn52fnfz/gtloL7AoLHJ2epGa9fINv90qWsE+Mn4S0B15ramc9xwHp
	A8vnSliTOhA7Jnwf6JNU31aNmwRqYWPXwmYaR/Kq3aI2FB3u6i88sVPy5xaTleVI+T1lLVVxOWV
	cL+h7JRdqk=
X-Received: by 2002:a05:622a:1e11:b0:530:b2e2:2f4 with SMTP id d75a77b69052e-5310d0a8dcfmr59810971cf.54.1789402048282;
        Mon, 14 Sep 2026 09:07:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4ba156sm101928181cf.19.2026.09.14.09.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:07:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 12:07:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: ehci-platform: Disable controller wakeup on
 removal
Message-ID: <1d42418c-0a0f-44f5-9be2-1e56013024a9@rowland.harvard.edu>
References: <20260913223732.92882-1-mhun512@gmail.com>
 <20260913223732.92882-2-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913223732.92882-2-mhun512@gmail.com>

On Sun, Sep 13, 2026 at 06:37:30PM -0400, Myeonghun Pak wrote:
> On wakeup-capable ACPI controllers, a successful probe-time wakeup enable
> leaves a source attached after driver unbind: usb_remove_hcd() does not
> disable controller wakeup.
> 
> Disable it after usb_remove_hcd() to balance the enable.
> 
> This issue was identified during our ongoing static-analysis research while
> reviewing kernel code.
> 
> Fixes: 776c15d0ad0c ("USB: ehci-platform: Add ACPI bindings for the EHCI platform driver.")
> Assisted-by: OpenAI:GPT-5.6
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---

For all three patches:

Acked-by: Alan Stern <stern@rowland.harvard.edu>
