Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A197246BC5
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677003; cv=none; b=Q5aK1S/0hlbllom2Lx8pOVoXNgBwTsqkZ1Zm4VT5Qmqa8TLrap/8Cv+pbN3n3+Ramj/YdlUlwg16ZcvlJR2BdPyC5HIdmn+Pa0Mg/BSdCuH0su+5WJBgA29qiv4Z7Go+Lwf5BGvpzxFqPNyisYKW7HIeT1LMM0hAm32GteVTau8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677003; c=relaxed/simple;
	bh=Jc+itJLFI7nZrOGiVGvgpQwW4Pcfy6oWEaHovGrRsyI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ui7LFl8aYd/E6+ePUcNBi1987AFyOcmo/iraRSk/5EqaNW8IJCdb8gjWzoI8UmCBqK3SM7IO4mc9juIbaPGyR/N6l71GV8R2/NGLuv2AJgpGykiE4nI7G8FkUdCo3IzqlZpX8dn3LdeORXh9vanRYV10ymNw6KlPAiXlxulYnB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEnUrwcg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEnUrwcg"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso840330e87.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 00:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769676999; x=1770281799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KG9xWqkx9/gF4du2pqNNAT1bO7cWgGHdinzUlqAxblE=;
        b=TEnUrwcgzvqUEfeMUFi8oGZgANM0sLjjtuudMaMHNkHgNpzOy5YpPoxQBlv39UVSkX
         UVjEZohWgzfZc2C3I5oZcQXAaSnKEo3MGSxImtNh/WGDtYz7CZtMyvjHqPRturs3doOo
         U7nrbpQfGhRfKeeJXxhRL3kW/zONl47O0PHS4UvPk6NEJKgua6g3ZzHHrAanZ/GO+kv0
         hf0bOEMS593C8RDwcHniT5Hn+pZ6H3kmLxw8+nj7kT/YOONV9BKuotwE5YrRxplTO4U0
         S1wQXRUlk8epcsQ1SuPwJ1O2RqnKZrgkDY/U809s+3tQnTB7YAg7DR8TVJ86ne4/usNd
         HwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769676999; x=1770281799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KG9xWqkx9/gF4du2pqNNAT1bO7cWgGHdinzUlqAxblE=;
        b=I7xG60iiXN9JJAoaEja0v6YcjmxYa25P7llLeXI6umst35w73c0n17eZv/iuz+RrlU
         oqgx8BOFVTupBDU9m88/nKnRoOwap0VV+ACl6Qwh4B+vogR6B0K0R8VurCSOjowS1hYw
         YF7C6EyxJpf6fgXDpdY4bR9XQwca4sZKAnZk3htGRpYpQEw5PwRQeJxXRY79WEX0S3XT
         O8BAmwXzGl8EG20C84p2XdxGch6ihBh3YN6js3UE9iAtnou2MaWz9sA1DHMMXG7KSbuA
         BAdWfzWELZIM3hEm0LRcDHvuZ2K60yo7CbeSE+kcl2cm6fuPYXsQOk/hnwSfecLd6zpb
         Mdsw==
X-Forwarded-Encrypted: i=1; AJvYcCVI+3XYEDpojDnmxgqYFpXeMs4H6OY6qjNMqBxiXdTqhUHhT+vpLZazP3T+zeND3acDU2v8wPtYjQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLdw/8rDGdzuwccYTjETnALZ9WlmXEXUFl+ln1AEGTlc47r7Jp
	VzHOtmmPpNyCZ0kuDix+4em9LOtkMLpbQaCFzd+DPq/EbvR+MQezFT4x
X-Gm-Gg: AZuq6aK97h9VYpUP8FJvSvhKN7yHDABzZkWIW9PDgWBqrZ+cq4s+9dkhisV9C/Um8Ai
	uKoZIp6u4v+t/vAuGbOksSstHDN5N8bboGm1YrjEnOotP8Iw6lK0ycJh/ak6AlgSJ9Op3gDmPCQ
	45RFN2grzH1ELkSOqRSLu191By5kdXMBxP6ItbyNoBC2ssxw3ID8HixZ7JHxqumsTgU/Q2hFMhR
	9BIgPhPKLrxN4nyMl+7LDPYaferFBmsucluvTq4r92PU+YKRQ7rlsbscQ0zKYviYch3BiMNPLn3
	128oT737ID8LoVIIHG2GsMPkIrYD8V/DejA/3OqtLSyTwvWqanIqgr9xiNsvuOxAORkNQQWJya/
	1LpwixrgbXROTyJ8HTwsfjMBlkKtsn6x6JP9GfCQpcKZEAHtEmUYj0hnzuoMPPacenx0WWpUAcs
	0SJ3+nfUyKt8hg6XAMvs0Vuhk=
X-Received: by 2002:a05:6512:159b:b0:59d:d342:88af with SMTP id 2adb3069b0e04-59e04017dc1mr3548716e87.16.1769676999124;
        Thu, 29 Jan 2026 00:56:39 -0800 (PST)
Received: from foxbook (bgw148.neoplus.adsl.tpnet.pl. [83.28.86.148])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fcd5bfsm7575811fa.47.2026.01.29.00.56.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jan 2026 00:56:38 -0800 (PST)
Date: Thu, 29 Jan 2026 09:56:34 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 jianhao.xu@seu.edu.cn, stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: xhci: Fix memory leak in xhci_disable_slot()
Message-ID: <20260129095634.0775dc40.michal.pecio@gmail.com>
In-Reply-To: <20260109045410.1532614-1-zilin@seu.edu.cn>
References: <20260109045410.1532614-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 Jan 2026 04:54:10 +0000, Zilin Guan wrote:
> xhci_alloc_command() allocates a command structure and, when the
> second argument is true, also allocates a completion structure.
> Currently, the error handling path in xhci_disable_slot() only frees
> the command structure using kfree(), causing the completion structure
> to leak.
> 
> Use xhci_free_command() instead of kfree(). xhci_free_command()
> correctly frees both the command structure and the associated
> completion structure. Since the command structure is allocated with
> zero-initialization, command->in_ctx is NULL and will not be
> erroneously freed by xhci_free_command().
> 
> This bug was found using an experimental static analysis tool we are
> developing. The tool is based on the LLVM framework and is
> specifically designed to detect memory management issues. It is
> currently under active development and not yet publicly available,
> but we plan to open-source it after our research is published.
> 
> The bug was originally detected on v6.13-rc1 using our static analysis
> tool, and we have verified that the issue persists in the latest
> mainline kernel.
> 
> We performed build testing on x86_64 with allyesconfig using
> GCC=11.4.0. Since triggering these error paths in xhci_disable_slot()
> requires specific hardware conditions or abnormal state, we were
> unable to construct a test case to reliably trigger these specific
> error paths at runtime.
> 
> Fixes: 7faac1953ed1 ("xhci: avoid race between disable slot command
> and host runtime suspend") CC: stable@vger.kernel.org
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>

This looks like correct fix to an actual bug, but it seems that it has
been missed? I see it neither in usb-next nor usb-linus or mainline.

The leak is still there, even if arguably a small and rare one.

Regards,
Michal
