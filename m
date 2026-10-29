Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283696;
	b=yt3xfKbkD3m1nex1ouuiEZPkO/KXqQMVjtCV2jJTBC4hYYbjV8o6uKWS8Y3rR8ChN+nq
	 YcUw/gO/JYIWGYw9QncME8dyxJi1ydwQGhULwIHkTkE7oQDQDYW1r8u4uZUkQWoAKhz//
	 LBJhnL3zWe1LSo2QqLLmW1d3bUjGh7zI1dREEgWKt/LbwOXW0iIiQdyodSE7zM84vlNDt
	 oaIp9uyTdTr7onYFUj8ApdlUOYO8HmTuPiLtRUBKTQBsh7vTYBPQCU3+LVM4AJ4VpdvH1
	 p5UL1V1OK1Exf1VEhWxfFckGwd+iJgfpNgZqK9nCaZeisnsWN1QLqioTqOWx1973szg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4PgsaR4ckK5t3xF1DMntq3pCLZ4hCM/y/z/GhVyNqpY=;
	b=Y5prjJmNemCmKFJf4PlRnuT5DV3lK0ccYwHZ/DIDcjw7mpbelP8kxaVa01+u+/k9W6Qx
	 0Oo5/TwyoDBM/RmiMTzrFiPwp9fRAltK5IN8AC69F/8lntKYgQdgzCuTY1XO0DFRXFlXU
	 0fK71YWJCxQ/j09JXMFweOqNAIxj/163yrKHPjPuyYRa9A087YeMv0PmMF3M+AvyaMINZ
	 JOjYxopU6GwNZ/HCiSYZ8Te95q4BczIzMbi+MztrMwTxvRXfqvSZSSX6nxm2WVfWwLRqO
	 caAvr1zLhbdi8k9nM0p4GPS2xSHAqLB63bfts9jhdq76fCrbFonDbAEmTYxRiNe8Uqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GNvHvBm4;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E5606B6E2
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 14:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C2E5606B6E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GNvHvBm4
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5366463571cso28634851cf.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793283694; x=1793888494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PgsaR4ckK5t3xF1DMntq3pCLZ4hCM/y/z/GhVyNqpY=;
        b=GNvHvBm4mMgh7rz8MsEf+usoEGfQS12MNY4qTikdK3l8nMefZobclBwbgYCNCHbMRQ
         18r86okFfxWendn/mBrUkDkjHO37BOSuwRAsYQaRtd+NFSifDxKXg2ZcgS7OBd+Diuu7
         qNpKS5+EyEvAq9qp9ijq+AOZLvmqvNN4WerwMjlTU/UTZkLC7iEryT7UqHm7xc1W7XEi
         zgUA+k6GBxsSqpo34PK8gzcqe2jesByU2cRcDnWENUt+95+Za2l1q1WjAFCugdv1YZOO
         9hzvf/Aykg3ibJOysRmQUBq/mk/TrzepBrYgWV/dhJguVvXjm9/Pyj04sln/C0sy8x6U
         xTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283694; x=1793888494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PgsaR4ckK5t3xF1DMntq3pCLZ4hCM/y/z/GhVyNqpY=;
        b=BdHvxHsBvKp/Oi36BluKZEkd6AwFWPFJ5vEzrPXCpaXwDDXYyI+2ptbpwaqQjwH0uc
         aZX3r5Zx+eRA1owheCXoXUt5QD1Eq7KWyAcac05MlK6fh269QzZn3pUF+AYb62ynX2vD
         KgWoLl0XPOHwzH8Oq54uPPraq742rqRaI0ZIKrnQjEhyRUz9slk+fq1xdg/+b4umBLJl
         iSGApZpggPMHe2uM16F+raF7nEA+6y2shz0Oc3GVDGOKpHcGw4jU+IR6DldHWmiHDN0q
         c8tWy9lDg4NP5HEKS2qYS3qT7QzpI7B+cuTNeut/m1rfxbzIPVERJe9SeXja/IUytN9+
         a39Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRQyZQi0nBBAntbFt3mw1j987yhzaBYgx5oUin5uZXyBH1U4ztMXTfE5/aGhvodni9w4XIiaxmmhA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr7GNbGi4POhXwMjFpO3rlysQ1VvWlT3UxKu+wGa3LGeGaHBKy
	NQYBxEH1mNZSV6qsIsd/ubNn4Nki5cYlFelxjoXUqnKEPAQF6qirQFgtE3JyWdDvhA==
X-Gm-Gg: AYBFou32WPuzPq8cvimqA2+uqYJRjea89Xm0fqAqB0sW2weioiKhHfl0Mgr0styzFhv
	PQTg7mrQUiaSusvMeoRoeQqZ4vXY2h0lDYh6oQ4m/uO5B3KfFur/9UonP16QUH5ff0B8zsCYT8T
	/qvZcHFd/4MVR+PZ/LBDW7YDiTJVoBs3MVeRj4/+zyGdDVF5/QiZiWM56ZJPxQH+JmbDMkz3vjw
	2R5OW7Qa5wP31yDHTTIfnThhRzsV+SuQk0sK8y/pXG/To7FJLM1GHd6eYbPZ07YQokGj9H31VYx
	T8qBttXloJAso8WC/UlsbiLslULaMAT8DwK3OMPcwAyiRAyB4fdd1Qci5vqK4KnfxTOyeExZJQ3
	67xRuPbdRFQOeFlmzuoxWh0OprmcnBrWqjaByf3LvC9JO6m2/U773cDwdjLeCU+L0AZOvWe8Ubk
	KmPbmTlQtgH+lXEp4fa+Il9UtQ2+VGi4YbbPzOO56PUp5vVJd4hZmUGtb8LCud5x4BU10zlOmbn
	0mK2zB9/M5KSs7lRjUwqi7l3gf5W+cimFA5wD0/pskysU393DlLGPsGFNPc/RGf6ZRwcibG2QXn
	HQv3AEYjqMsd6FUQac1Rx3RWJUZfNfFOTRVE5igQNl2X2kw=
X-Received: by 2002:a05:622a:58a:b0:536:76ae:94b1 with SMTP id d75a77b69052e-53fcc9beae1mr90780141cf.55.1793283693937;
        Thu, 29 Oct 2026 07:21:33 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm131305831cf.13.2026.10.29.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:21:33 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:21:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	IgorpetinDev <igorpetindev@gmail.com>, Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <f4c1664b-1c89-49c3-a5cf-7c496e63ed3a@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
 <20261025000643.425c57ca.michal.pecio@gmail.com>
 <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
 <2026102924-flashily-myspace-60a8@gregkh>
 <20261029114422.2ba64d53.michal.pecio@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029114422.2ba64d53.michal.pecio@gmail.com>

On Thu, Oct 29, 2026 at 11:44:22AM +0100, Michal Pecio wrote:
> On Thu, 29 Oct 2026 10:42:35 +0100, Greg Kroah-Hartman wrote:
> > On Sun, Oct 25, 2026 at 10:54:57AM +0300, IgorpetinDev wrote:
> > > Hi Michal,
> > >   
> > > > No such domain?
> > > > Looks like you trusted an LLM ;)  
> > > 
> > > good catch, that was just a clumsy typo on my part: I accidentally typed
> > > appspotmail.com instead of appspot.com in the closes tag, anyway - the syzbot ID
> > > itself is valid. If Greg or Alan prefer a v4 to fix the URL typo, I'll
> > > gladly resend it, or it can be fixed up when applying.  
> > 
> > Please fix up and send a new version.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> This race had been reported by syzbot previously and a patch
> has been hanging on linux-usb since August.
> 
> https://lore.kernel.org/linux-usb/20260823125831.6ea35650.michal.pecio@gmail.com/
> 
> There is only a bit of controversy over flushing vs cancelling the
> work. I think that cancelling (and leaking stray completions as opposed
> to letting them run, likely UAF things and maybe corrupt memory) is the
> right choice, as a courtesy to anyone who might create such bugs and
> need to deal with them.

I have to agree that Michal's patch is more elegant than Igor's.

(Although, as a small nit, I would change the last line of the new 
comment from:

	 * However, we still must kill these works so they don't UAF the HCD.

to something more precise, like this:

	 * However, we still must wait for the BH work items to finish
	 * because they access the hcd structure, which is about to be
	 * deallocated.  Any URBs not yet handled will just have to leak.

It's a minor thing.)

Alan Stern
