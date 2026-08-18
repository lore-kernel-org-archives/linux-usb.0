Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6617471CE4
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068701; cv=none; b=CTeVbzDbL7sj3cliubyvPsicK+x4igB0LzUGf/2c3tzS3VYPA0xBoYw9mxpq6PmFBomsTp4E/zePxwCk1ZMfvrb5ZUb0RlmGqgka4Y/3A3+14hPpgqBIW+2Dn8zBJL0BB3jiJbVmgbkQDUXq50adW5mmVWgnXUVoY4du2L0X6t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068701; c=relaxed/simple;
	bh=EMjJvFYFUyo0jlLVoUwq56z0iM/h3bzklSv/vgkbFbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7NySdcAB7g1flyMwQHVNTKF47+6QUrTrwkMMPEtI0BME+3QnpwPLh3Al9ZpsV9+ln+COlsFro6vue5n8hKlQAS1xxRk5MmEKQilGHdDFx0CzV08BCwdelZi5gy4QBRpGVSoffsqSdKFxJZuSsFlB1brY/H81w0eJBp7NPHNU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=slg/XJ1v; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="slg/XJ1v"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5218927884fso46776311cf.3
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787068699; x=1787673499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLFK+CS/9o2sBuETagn7m9l+5x3yjhHN6Gg3zPg3uG0=;
        b=slg/XJ1vFUU5howfhx4cpOCO83Hsm76yFteAeLrYcYPngU0kXCx4K4nWRoiEpFUEsi
         Nq4AmTAa6c/2TXHMoWStO7KlReWK3SK9WPcJ3VEeN1I7Ql8noHDSgsYCxfmPY5eycFz9
         NK/LwT8toScdLiUM9sEEKp+hLepLbgw8SFqeP4ZxYFR5RaubSMrhtFEC2K9aZGdGs8Ua
         h8I4uQ5jU+kNhw57/ldYylnt4x5BKQlsCLW3XqkMqvnjoqQXXf9fRK1PaU3ssfT/31dV
         Y1eDznCldjseiwfKjEZjznbMDKi39SnW03UvehSbbknsfqC8FGA5lQX/ZGa19/Cr7R8A
         eheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068699; x=1787673499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLFK+CS/9o2sBuETagn7m9l+5x3yjhHN6Gg3zPg3uG0=;
        b=GuGsBHYBEpayrDmIUbgw7OG2OT1pVr7/4lbkUqSn+yqmZkpE/o1UaSMnDsJZ75B2Fo
         VMUypz6+uLSI58LKvXgj56nRmmI/0C9hpxwNpgSPO2m+yIkurNyi+0Mtq3DLorJHTKm4
         0YTrWW3Tkigg+oDfdzpCB6UF35Wg8QCTG82QD4+fbSq0fLJNf42xpIiutO1Emdlr0n0f
         ZO+FsPNZn4X6IKnGfC4EMMGHXhzER71gdGpnaD5igOapvcCa8KiA7hVSkhR5jI8Xz5Ga
         oIs4R8lOdeqeuHneIKC7vvroeV968w3myiDfGpL6YfIusKn9t7XOvZpxNnbtSxPH/2g7
         RtIw==
X-Forwarded-Encrypted: i=1; AHgh+RpbJG0tOz5IdVJnmW1W6Zu8RTnsYbgfZ/vav4k6b8QBdCpAH9+pkQOHmxcKYXNZcPuubnMUaI0H52M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt+gulaIQtWMg44b55wW/xlgTaUdtARz5zhhgpsjIZhbMrlHVB
	ZiMZ3nQ23k75UNhGY3f9RCCgcvsmT1JOWpopcL5FzJxVcuY2vvJ0JC8uxjcSO0cS1Q==
X-Gm-Gg: AR+sD12yB2SAzWPUk8osF/XxCP9KabruokacMVphvJgYPAry6jm4lt8+fQAMb40qkdM
	N9ZHOqRsspLCRhg3XjjNpHdOjU8nOuKLmA6wiHztJ/pyhCnGRdvoIbh58i4b+oW8dHRlKSAJzN3
	BV4I4qKyo2BotqoXqFrTXTwG4NAhaNTN7iRMzjz89TVFWKTHGJgSqT1nj6C8Sm3vT0pNRp92urQ
	WmPVzHQ1U/AB58csQtqVjB3lWa56DUsKH9NzENDupEirb5zRmObnOm20ws1ZvPPAL29UFK08frH
	8aH7qFzxXmGC0io00at8JRYGXm4wbq6rv2AqyuSviplCUiP3AvJmX067Jv6kNTmbPWR/orRRlu/
	ECGh75aRAb9aegwDvNn6xKijqRddtRi5wdj1Du/vpAHNz/FS8Vz2st3YVhvrHFhSdFQr0VfdBXr
	FGVEa03ei3sEtoxx8wwDTAvaUSt7lBRCLKQM91E/WOldLVP1+RSwX4ra6BMwTmochfSY+KKmrwd
	A==
X-Received: by 2002:ac8:5cd1:0:b0:52d:5e88:4246 with SMTP id d75a77b69052e-52d8534c2ffmr396037101cf.16.1787068694013;
        Tue, 18 Aug 2026 08:58:14 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c4597568fsm34614046d6.39.2026.08.18.08.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:58:12 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:58:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Vaibhav Nagare <nagarevaibhav@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Vaibhav Nagare <vnagare@redhat.com>
Subject: Re: [PATCH] usb: ehci: fix QTD list corruption in qh_completions
Message-ID: <03dec848-580a-476c-bdc4-8a8b9d2e80e9@rowland.harvard.edu>
References: <20260818083323.2270580-1-vnagare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818083323.2270580-1-vnagare@redhat.com>

On Tue, Aug 18, 2026 at 02:03:23PM +0530, Vaibhav Nagare wrote:
> In qh_completions(), when completing a URB at a URB boundary
> (last->urb != urb), ehci_urb_done() is called which drops ehci->lock
> via usb_hcd_giveback_urb() for the completion callback. While the lock
> is dropped, a concurrent ehci_urb_dequeue() (e.g. from a TX timeout
> recovery) can modify the QTD list, making the 'tmp' pointer saved by
> list_for_each_safe() stale. Continuing iteration with a stale pointer
> leads to list_del() corruption and a kernel panic:
> 
>     list_del corruption. prev->next should be ff27e4e01aefa580,
>     but was ff27e4e01aefa1c0
>     kernel BUG at lib/list_debug.c:51!
>     Call Trace:
>       qh_completions+0x28f/0x640
>       ehci_work.part.0+0x1d5/0x330
>       ehci_irq+0x3d2/0x490
> 
> This was observed on systems with an HPE iLO5 Virtual NIC (cdc_ncm)
> where repeated NETDEV WATCHDOG TX timeouts trigger concurrent URB
> unlinks that race with the qh_completions lock-drop window.
> 
> Fix this by freeing the completed QTD and restarting the list scan
> via the existing rescan label after ehci_urb_done(). This is safe
> because already-processed QTDs have been removed via list_del() and
> the list is strictly shrinking, guaranteeing forward progress.

This is good thing to fix, but have you considered what should happen to 
the "end" ehci_qtd pointer when the scan is restarted?

Alan Stern

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vaibhav Nagare <vnagare@redhat.com>
> ---
>  drivers/usb/host/ehci-q.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> index ba37a9fcab92..c715648e97ab 100644
> --- a/drivers/usb/host/ehci-q.c
> +++ b/drivers/usb/host/ehci-q.c
> @@ -328,7 +328,16 @@ qh_completions (struct ehci_hcd *ehci, struct ehci_qh *qh)
>  		if (last) {
>  			if (likely (last->urb != urb)) {
>  				ehci_urb_done(ehci, last->urb, last_status);
> -				last_status = -EINPROGRESS;
> +				/*
> +				 * ehci_urb_done() drops ehci->lock for the
> +				 * completion callback. The QTD list may have
> +				 * been modified (e.g. by URB unlink during
> +				 * TX timeout recovery). The 'tmp' saved by
> +				 * list_for_each_safe() may be stale.
> +				 * Free last and restart the scan.
> +				 */
> +				ehci_qtd_free(ehci, last);
> +				goto rescan;
>  			}
>  			ehci_qtd_free (ehci, last);
>  			last = NULL;
> -- 
> 2.54.0
> 
