Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794140812;
	b=Vh50fNeG8iX7NCdsWF0UHDHwxOuRRVkvtY2bogmvngfw+E3Mu+xDhgFpIh2p/5UUKfGQ
	 Z6Ji8Sdfm0H1KXbZ9axA+x+ZeaVKnIzovud0jnLmieSiHC1s0T60K9OxJGNLiLYByRLCv
	 IBJCQxRShd30nbiFIzXPJX4cEanwQ7abD7Gb/356Z3+bOifaSXlOfd4g2U53Exsf0/64g
	 KTtb6NZlSakFE4Mr7KHtKwIqlp84ZhJPKCFDfQBESqHnQCkSRS1lYvZmYSgncBX8j6839
	 Iofv46Ut5Uy6JOqpWaTYH/vqc8AZCOaoQA7ghs50x7+7bLBF8u0mMzNNXuHpKdkkz0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
	b=tUG3URQAgSyiw3lICjuzystM1Q+1yBzCYqCBt9vLyUkqeVTdj2akM0vgLJouxLoWyQpq
	 5dvanjs7EhxVwEYZERwnQbFR8FSiQi/ps5v3FAAz3J3m22J0N1A5dMGHxcRXX0yeJtmFe
	 s8KZa6QapKDro8Nq2jv4qfMS66kM5B4sqCRDpIAw/jtGIYCoGonF3YCKXEHdoiOh1kR6f
	 aBUYgMkUjs1rx5nmQbj8r7h6J/M1U6VHMFNy6b9kIAVCm/W26vTsbJWl729i5MAY0E82B
	 hy2jvehTKT9RCY5t/Zgn56Si7zVG3UrMUAaC235Pak3LcCreLut25yFjTJl9oLkRngg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7Q4NvzQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFC3606A320
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 12:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CFC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7Q4NvzQ
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso195848c88.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Nov 2026 04:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794140811; cv=none;
        d=google.com; s=arc-20260327;
        b=mmEbMZbutUHFPprawiUFtKf89F9FrBb+Dpu1ycp7fjjZCCnt5O4UzIRyl0M8/on4Dw
         xVH2jtEPdGvSjFrcXkrJK4OrHaja6FEjdPQsxYgvEZQxiGxsVDrXCklxtpBjt+nbhOv9
         NTkA5U7/bF7otr+utC3cT110wwOKZhj1lW1oNaiL+iQEiwOOr07uUj9emaRJ3zfuzmC+
         Zy9awbP8s1mzmU6HEMPgWTkjOYIxWvY4Kx6Ici/ZoLI7/xsDplZPF2ygzA5CN13iPUDv
         uDLDHwlSeGuHwqse7xoKIy4H36h/zicEvP5t3E2/0y44/skE2RW+eRxegzVvFKBeBaGu
         J7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
        fh=/XafWwXInU6xSAMitUKTVJtcnn7zkW/jx5Qszu7SSug=;
        b=azi0AFIhMX5VvjK8AP7qxaMQhdORPxefJ3HJDOmFcuqQuPB6bRIMEMN7AMBxg6+bNx
         Vik/Fe6wEqQI1dHHympeO7t1B9bpP/u9bOTbyCMh2Nll2sDiiIu5u+FfN248rPrYgQzJ
         3wqpQLFr0iaebCS5aQ8Y63fog14eoTi8uRUJ/FJKwSekiIoE+JnS6f3tF3B1033Ia+Q3
         Qe/9wIUeRxmii69h2nBGCI60ylvpSRFE0Hvp7EtzZ9jyE+3GQeInnH4GEZhHM5/HGJAJ
         r3Rl5Osacf+H+hDSk9f0wgeYYE9/MQTQV5UAwP2RQlMHE6yG26ziSUtgfkHOh5LXuEO0
         yPOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794140811; x=1794745611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
        b=W7Q4NvzQGy21GdAGxyIZ6u7m5eLnJoH/K8kDBumB2Z8IWkUPBUbJQiMz5JJ5moHpty
         0Zzp4J9dWdQS+8ggxBOSig0RzZMT/tNVPvezgaIfMbUYKxen/+ig9hg1uijsJ9aaLFPD
         ejftiSgTWgUWbR5dp4YoVo0hfoNsVXVPOicBdRIYsT+iPk3zcLBT2ohzMStVNLIZG5rD
         6UHLCrmD/dfm+mNb8fh78bobJ1R9w4QHMuGjbdwYKVE7AquylErWZDOpZmML4cA5vfmn
         PTC6gZtvAULpoCYMMM6q6sTfxUHKQSplddMP7p62nLxiNRXfPE3uj9AgxUb+klmn5T6j
         pLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794140811; x=1794745611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqwRM/SBzStrLxfx3VuXAqI5XajuTtTqpXOFdyv1pFg=;
        b=sV3F9DXQblElDmvbZ8Y5g3Dsjhd8VwygQyIUduufQCpqUFGlCwLAVC3r2AtBynURb9
         8j9Iy5gCEn4lXTlxVhnTNUFdG/Coh0iaqxfrI9nQFnOZxQyIAi5LsgZJSbW8KPJkJ++9
         23HX0kjfR+mS9X2WfEQOlIaPBCJilrNGqZR+sbSuTBzyBJLGmSVjfqtHW8xVkxQJKu1x
         VYFizh7r2HHRJFbp8UiWDMq5wLqkk+8ys3SMe+LBG5bRVZ9XAILkK0x+bJfkiunz1p0w
         mF9OZRZBKET1x1nTUMYnU3CASygmvp7tPpIqibDSmcx1p02gRpDJvByR1aCWs7d07Huf
         WmoA==
X-Gm-Message-State: APuU4Z/BPrAcJNF9TVEK4ROcIqamnbJRF5Lf4JrB0ORIUdKcj0ogtlrk
	klDCePFehudnK5ht79v1qvgPhng37HIhtG5QXsEEKuIkV2/0kZH7GQo8WpSGSm/0Jjk6R8RPcYz
	6Yxq2Hi8Xo21uryTGe9zPzbYIRO7lfI2uJ8CwNDM=
X-Gm-Gg: AYBFou27OVIxfP/wqtNmMwENIiyZ0miuWmu5oPiU/Cy72Nt2sPR8LwxoekFAm4QptBD
	2KQqeNyMxb9hik/gQvyPyWvE193tqQrY6Di3NZq0d48Qlq2xabCTfVPLoZ60NXSogRhpG1F774f
	uW9JcRtgWJCf82evuvU5F6Ao3IlSQUkE8IDUBwvSC6OoWdRkX7L1T4YZPDXdfD/0KsQ1ysZ1DJg
	BntwTj+UK/SZxwl6+E0CUMVcX40X6mGb640Wv9nlBOy+6wCjEDGxVs6BbNxuAyNARhe0gcxVdjc
	96QAj/eJ98OHvkHJs0BGXvO0+e/e5UszxIbbxzfnOpkbLwWssPK4spGWqx4Z1uyOpZAIYndY/U7
	YzNseoi3u62aejbLXzaxcp1VYrqkxLCLgulSskXuRZ0xwaaaJihZ3k3jZUNrcl/dNkyj0
X-Received: by 2002:a05:7300:1c0b:b0:366:2893:7421 with SMTP id
 5a478bee46e88-3725d77d5a3mr2667000eec.10.1794140811086; Sun, 08 Nov 2026
 04:26:51 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108075116.251501-1-hj351016@gmail.com> <sashiko-outbox-203644@kernel.org>
In-Reply-To: <sashiko-outbox-203644@kernel.org>
From: khj <hj351016@gmail.com>
Date: Sun, 8 Nov 2026 21:26:39 +0900
X-Gm-Features: AclHuK8osNMBBduPbbtZlOwueo3fS_08uTUPSOwGZBoE2xOvgWzT7m2_givR3xg
Message-ID: <CAGr5VtMcrnHRZWjoL92uQJFgPcigv+Py=-R_S-a3rNRE0XtOAQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: cancel playback_work before
 freeing f_audio
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- all four are valid, and the Critical is the real root cause.

v1 only cancelled playback_work, which is necessary but not sufficient:
as you note, f_audio_disable() is empty, so out_ep stays enabled and
f_audio_complete() can run against freed memory during unbind regardless
of the work. v1 also cancelled after gaudio_cleanup() and leaked the
play_queue buffers.

v2 implements f_audio_disable() to quiesce the function properly: disable
the OUT endpoint (which gives back the outstanding requests, so
f_audio_complete() stops touching the freed f_audio and no new work is
queued), then cancel_work_sync() the playback work, then free the buffers
left on play_queue/copy_buf. That addresses the Critical, the ordering,
and the leak in one place. I've also corrected the Fixes: tag to
f3a3406b3f56 per your note.

2026=EB=85=84 11=EC=9B=94 8=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 5:13, <=
sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [Medium] usb: gadget: f_uac1_legacy: cancel_work_sync() after
>   gaudio_cleanup()
> - [Medium] usb: gadget: f_uac1_legacy: play_queue buffer leak in
>   f_audio_free()
> - [Low] usb: gadget: f_uac1_legacy: Fixes tag cites file rename commit
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] usb: gadget: f_uac1_legacy: use-after-free in
>   f_audio_complete() due to undisabled out_ep [1]
> --
>
> commit 12cbf9965abf5188436aa00e354e601adc2d615b
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> > usb: gadget: f_uac1_legacy: cancel playback_work before freeing f_audio
> >
> > The OUT endpoint completion (f_audio_out_ep_complete) and the set_alt p=
ath
> > schedule audio->playback_work, whose handler (f_audio_playback_work)
> > dereferences the f_audio (audio->lock, audio->play_queue, audio->card).
> > On teardown f_audio_free() frees the f_audio with kfree(audio) but neve=
r
> > cancels playback_work -- f_audio_disable() is empty and nothing else
> > drains it. A playback_work still pending when the function is freed run=
s
> > against freed memory, a use-after-free.
> >
> > Cancel playback_work in f_audio_free() before kfree(audio). By then the
> > function is unbound and the OUT endpoint is disabled, so the work canno=
t
> > be re-queued and cancel_work_sync() is sufficient.
> >
> > This was reproduced with KASAN as a slab-use-after-free in
> > u_audio_playback(), reached from f_audio_playback_work(), under dummy_h=
cd:
> > with a UAC1 playback stream active, unlinking the configfs function fre=
es
> > the f_audio in f_audio_free() while the work is still in flight. A dela=
y
> > was added to the gadget streaming path to make the schedule-vs-free rac=
e
> > land deterministically; the missing cancel is present regardless. With
> > this patch applied the splat no longer occurs.
> >
> > Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implem=
entation legacy")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
>
> [Severity: Low]
> Commit d355339eecd9 ("usb: gadget: function: make current f_uac1
> implementation legacy") only renamed f_uac1.c to f_uac1_legacy.c.  Should
> the Fixes: tag point to f3a3406b3f56 ("usb: gadget: f_uac1: convert to ne=
w
> function interface with backward compatibility"), which introduced
> f_audio_free() without cancelling playback_work?
>
> > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/=
gadget/function/f_uac1_legacy.c
> > index 7c8d60c7e87d1..2dca5cda8cfd7 100644
> > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > @@ -945,6 +945,12 @@ static void f_audio_free(struct usb_function *f)
> >
> >       gaudio_cleanup(&audio->card);
> >       opts =3D container_of(f->fi, struct f_uac1_legacy_opts, func_inst=
);
> > +     /*
> > +      * The function is already unbound, so the OUT endpoint can no lo=
nger
> > +      * queue playback_work. Drain any work still pending before the
> > +      * containing f_audio is freed, otherwise it runs against freed m=
emory.
> > +      */
> > +     cancel_work_sync(&audio->playback_work);
> >       kfree(audio);
>
> [Severity: Medium]
> Should cancel_work_sync(&audio->playback_work) be called before
> gaudio_cleanup(&audio->card)?
>
> f_audio_playback_work() calls u_audio_playback(&audio->card, ...), which
> reads substream->runtime from card->playback.substream and loops back to
> try_again when snd_pcm_kernel_write() fails.  Calling gaudio_cleanup()
> first closes card->playback.filp while playback_work may still be running=
,
> which can free substream->runtime underneath u_audio_playback() or leave =
it
> retrying in try_again while cancel_work_sync() waits.
>
> [Severity: Medium]
> Does cancelling audio->playback_work here leak buffers left on
> audio->play_queue (as well as audio->copy_buf)?
>
> f_audio_out_ep_complete() and f_audio_set_alt() append each allocated
> struct f_audio_buf to audio->play_queue and schedule audio->playback_work=
,
> and f_audio_playback_work() is the only place that dequeues and frees the=
m
> with f_audio_buffer_free().  When cancel_work_sync() cancels a pending wo=
rk
> item, or when more than one buffer is queued, the remaining buffers on
> audio->play_queue are never freed before kfree(audio).
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but nothing disables
> audio->out_ep before f_audio_free() runs [1], so can
> f_audio_complete() still race with teardown and use audio after free?
>
> When the host selects alternate setting 1, f_audio_set_alt() enables
> audio->out_ep and queues usb_request objects with req->context =3D audio =
and
> req->complete =3D f_audio_complete, while f_audio_disable() is a no-op an=
d
> neither f_audio_set_alt(), f_audio_unbind(), nor f_audio_free() calls
> usb_ep_disable(audio->out_ep):
>
> CPU0                                  CPU1
> f_audio_free()
>   cancel_work_sync(&audio->playback_work)
>   kfree(audio)
>                                       f_audio_complete()
>                                         audio =3D req->context
>                                         out_ep =3D audio->out_ep <-- use-=
after-free
>                                         f_audio_out_ep_complete()
>                                           schedule_work(&audio->playback_=
work)
>
> During gadget_unbind_driver(), udc->driver->unbind() runs before
> usb_gadget_udc_stop_locked() gives back pending requests on the enabled
> endpoint with -ESHUTDOWN, so f_audio_complete() can also be invoked after
> f_audio is freed.
>
> [1] https://sashiko.dev/#/bug/linux-7598f007-24ed-4b73-bc9a-a11e4ec9838e
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108075116.25=
1501-1-hj351016@gmail.com?part=3D1
