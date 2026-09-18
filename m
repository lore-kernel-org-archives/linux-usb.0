Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0076E346771
	for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741053; cv=none; b=KhhT6eYVs8l5no6WVMW15BQsrZPHsnHHzAcOVH1s35zukv7Kieowib2anvvp4q2n1awv2rnR6De9s4qQY+UZUsoEdYL8UVxMKlyYNd5NoAMgT57ima47hv5VTfpC6M3hVZqo0qfYQLuPQ64zLzm2XS8YhQjwXdw25JbEPuXLAaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741053; c=relaxed/simple;
	bh=0SUOoIAUaLT7F1Gk4YYUyXePP6L3UTYZWjgmxML1hhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tc1JxyQbRtRier2N4R1xWH+6msM1O4RQcNx9jon8TfrkZxuT2QkW5VkQRxnU/kuaIYsFT/JzGJEPrS47fcjs31/+SL0/cGLQmma/FKuSSQxOHuTf3Gr1p27wxrkU7M2Q3FqnVb8mR0K+ufQyZ5YLO4D2A6z2mUhJjhR9/jgN2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tbnp0DPF; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tbnp0DPF"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb769ca02so9172141cf.0
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789741051; x=1790345851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uadj5t2QE0GhPwN/LGtDC4GsH7sMKtOhGKh1V/7jDls=;
        b=tbnp0DPFZzCzJI92LO+DZBa4LFBADqSgbjMCOiVY0f04DmdXMo7xhxkmxpftADnhCX
         vEmsFrGVJC5hraBVWBUbx+1ApcBwRU2hbl2Wp7frwdHb3Qsa8rmbKo8WtS4qynZMxFnO
         X3eZceM3ShMYND/1X5fbiTV9ARGkdeEz+BaLOKxYg+qRtUxjy8AHHyDRUMeWiFv5eiwZ
         6cqp7hZL1h/ASPxGHzYH3jl4HBlrgFi1BmLeqvg/AXAgSO5gJPs6O+RfUuMOdXKhBsso
         D3kC6Phnj1Ob5lyLRkVkfaFhgBaqWv/Yy0JGoLndPS0E2qi0mz5d+vGtuXl1EEJugffC
         M2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741051; x=1790345851;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uadj5t2QE0GhPwN/LGtDC4GsH7sMKtOhGKh1V/7jDls=;
        b=hCE9VBQFUflju4laypcdGPmegoeeDXNSAGY9ltq9XMMEIqH9kN7PQEf+LNbKDfLUVp
         11dvGrXn6DI9I4YCHNAP8MSDm/DlKVTwstErBu09qypMfzXZgFtWUOxue42N0Trh5EyV
         cehy9ajufmC4HxJUqGgvXUGQIaOfIIa9iyQxxn7PuO/GMvdqD4Pk+wFZKdvL/2GlOGXQ
         HynnA92mc8U4TIlo25NxFeQCV3Gt4AoqdQAAvX2WRVQYRVEAHOT3lTp0UkRQOJJLEXgn
         FVs7Kjy9PrrRGVmP1j3XsCE94jmyD4QDal0LUXee/ITYUbWFNyo7VZVIFW8H2smqdaYp
         SOEg==
X-Forwarded-Encrypted: i=1; AKwUvBxj224ETTuKcQybXxSLhoMd81sAEUpiyNe19FNcW0ERob/kQV7Adwulpoug+XWAoQyO8jXhxjsGXlM=@vger.kernel.org
X-Gm-Message-State: AFuF++m9oXDIrlvCx6T4R9j2Mci3MaA5j3VfqHV+7ZIPU4vXhLE3qthe
	P9R1EADniRVnOse2l+UHxCBd4c558Awu0Pg1ep27AuZCJNVwJ0ZKJaqyAbkD4zGB7Q==
X-Gm-Gg: AYBFou0hTBq6L/o509S3XE56jQpf1CW+WBGBo3aXiRb+OGxizDJxlrMGrLWkAP6Dqn7
	dxDXcDPNX0nSHs6bdKnHbScYkrJG2rb46PbajaG1E90FhRUKqNgaADHIRvx5iU1jTLk+BIxoegQ
	CoDIGWopZUa6h6UWbxewv6XKroOP/xW9/atZWd+DU43cY/B8uusJAIX6PHq8fIDLWvB/1IkWxez
	n107UNG9RAW/3HQsTxhqVXQDNVm/cbVGv2q10DcmilfxKAqh9UQtoMYbQr4gHBJ4kRSpkZsjDpp
	jmF1RuXcPoP3Hvf9J3QiAJIvpgRKFiS2Ce85w0V1YrXfVE2P8ZhnBZaRaRS+ItMLgd451GsOsQa
	4Gm0k9r+9rSIKLGsYUiEJ0TCuXtUhqyjMvPlO8LO2U1BSpQDTyNf2Mg70gm9fDoFRQsbD+nRgF+
	2HsOK9pZLayy8GDp2TxuLplo3GPYPPdhe6iDDSvBx83IUMsIaFv9oGvWd2oyxjgzp2xMafYz1u
X-Received: by 2002:a05:622a:4c16:b0:52d:28f8:578c with SMTP id d75a77b69052e-5329e393052mr40542951cf.31.1789741050517;
        Fri, 18 Sep 2026 07:17:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ac48dfc9sm1986711cf.8.2026.09.18.07.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:17:28 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:17:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Minseo Kim <neck3922@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [BUG] usb: gadgetfs: KASAN null-ptr-deref and intermittent UAF
 in ep_aio_cancel()
Message-ID: <fd663410-6aff-42f1-a6e7-652f073fdafe@rowland.harvard.edu>
References: <1a93bb26-9ded-4b71-b409-62896a2681a6@rowland.harvard.edu>
 <CAFmvuTUogd8MyQM02VpM7iHaopzrOoex+X-McQE28X1fgb_AeQ@mail.gmail.com>
 <0b6b13ff-789e-4ba4-9765-1052a154ef27@rowland.harvard.edu>
 <CAFmvuTXeg2LykJa060WUYAhhQpdwGV74VFkMb6Wu5zjyqWzxmw@mail.gmail.com>
 <f42b44ef-b083-4976-bf06-f2a21098474b@rowland.harvard.edu>
 <CAFmvuTUZ+iP313qz5J5vaT7QGz2y-tHQ6XMrq2tnvStZqXDECg@mail.gmail.com>
 <7a87e293-633c-4100-aa8d-91560ba5e5c5@rowland.harvard.edu>
 <CAFmvuTU9xfCWFaoXzE6J0uC6y6eCZ43CRg+JWkLV3dgLNYu5Cw@mail.gmail.com>
 <9c07ce98-a5bf-4bcc-9304-e7f5e1747842@rowland.harvard.edu>
 <CAFmvuTW5kqF8zNp7wSxB3abhD9ZvfJ0gu9Si8kRTiwcuXOeVuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFmvuTW5kqF8zNp7wSxB3abhD9ZvfJ0gu9Si8kRTiwcuXOeVuw@mail.gmail.com>

On Fri, Sep 18, 2026 at 10:30:00PM +0900, Minseo Kim wrote:
> Hi Alan,
> 
> > I wonder which part of the code was holding udc_usage above 0?
> 
> It was the udc_usage increment in ep_aio() during request submission.
> The increment occurs before dev->lock is released to call
> kiocb_set_cancel_fn() and usb_ep_queue(), and the corresponding decrement
> occurs after usb_ep_queue() returns:
> 
>     ++epdata->dev->udc_usage;
>     spin_unlock_irq(&epdata->dev->lock);
> 
>     kiocb_set_cancel_fn(iocb, ep_aio_cancel);
>     value = usb_ep_queue(ep, req, GFP_KERNEL);
> 
>     spin_lock_irq(&epdata->dev->lock);
>     --epdata->dev->udc_usage;
> 
> In the matched control, a request with a length of 64 bytes took the
> direct giveback path, where dummy_queue() calls
> usb_gadget_giveback_request() before returning to usb_ep_queue().
> usb_gadget_giveback_request() synchronously invokes the request's
> completion callback, which was ep_aio_complete() in this test. Because I
> held ep_aio_complete() at the diagnostic gate immediately after
> iocb->ki_complete() returned, the nested giveback call could not return.
> Consequently, neither dummy_queue() nor usb_ep_queue() had returned, and
> ep_aio() had not reached the decrement. gadgetfs_unbind() therefore saw
> udc_usage at 1 and waited.

Of course.  Now I get it.

> In the normal transfer test, by contrast, usb_ep_queue() returned and
> ep_aio() decremented udc_usage before the later completion callback ran.
> I confirmed this ordering in three runs without enabling a callback
> gate.
> 
> I verified the sequence for direct giveback with markers after the
> increment, after usb_ep_queue() returned but before the decrement, after
> the decrement, and immediately before and after the unbind wait. In each
> of three runs, markers with the same dev pointer showed ep_aio()
> incrementing udc_usage to 1 and gadgetfs_unbind() entering the udc_usage
> wait with the count still at 1. After I released the diagnostic gate,
> usb_ep_queue() returned, ep_aio() decremented the count to 0, and
> gadgetfs_unbind() left the wait.
> 
> > I will submit the patches, with your Signed-off-by:
> > added to this one also, if that's okay with you.
> 
> Yes, that is okay with me. Please add it as:
> 
> Minseo Kim <neck3922@gmail.com>

I will, and I will CC: you on the submissions.

Alan Stern
