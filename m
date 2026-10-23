Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792783899;
	b=IEcPeALQ2+WCWWCDRNAbGTdMagVJEcOlJFeoYJsVUTqsWatKmiWgiU3waUXpjsrInNw1
	 GHOXYDaXNk/824TN4gajOb3gghKARn4NOi6CMt1XmLLUDRueTgpgYPvGnLcpCqitDq37Y
	 bFBSb18JNRQHSOOzXJ97eo4OwxSzd9u6bJ3LkQ1k5DN74Xl4BUh0b0/v9+jYMvXlm9R/t
	 snYmmLAmN/678sINOiAJkB0qmkBHFXf2R92LAykbNp3v6VjuUw22Wa4ttH1JaAAot0I4y
	 M3JtJeoliKY/BG/wXDXIKtHvX50HvjqB286QQ1YNgWW21RY6fRyRh0jP1j78ao8sX4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
	b=sfda9aDR0L3q6lH3pYlM7qUZ887+RWt2xcZ8LS1k8MZxK+N//sNJ33nLoDiLhxYp+FxW
	 haiLjzPNHE2P8eWOY4s6TnjyTXAWqs9WceuByRHif/bKggalYxp0fTLsPu8XQgiqOiJCZ
	 Za4ceHXnQI/av9DTI4VNw+hZT9JhyEtFiRaWfcEvcaDpfg0hOxDcI57kXU2qw2C1yeS8k
	 Qob7LItFQrO00ZYCZZ8SopViurZ/r3coSWerpVmwEtY0G2/nqdPZ79agFDD1DUxqgp/Cq
	 Serxo1NdTgaLqGrvL9W7JTI8PVepXIIW+qZT36eKnq+sHUxcsarkyZ67uFr35lbql/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fM4pp+17;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663E6606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 19:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663E6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fM4pp+17
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so11617031fa.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792783897; cv=none;
        d=google.com; s=arc-20260327;
        b=CQlt38t4zhQpbIqgU1PS19PFBrE1zhRt3/6J7dXCg94NonhUAb4Re6GJkHOrTr15eC
         nDTY6j3d/awvfEdIY07XaS5p987G2sw9CeFGM25JI5f9YWpcQcKqZ8HSDguT3BpZem+x
         ly/7iQ/+1Ek9z2CqOpaBygZ9L6SFr6pwDcW4KFGGcIPtjSEwVMnJWCRjiJyI8s2GHMft
         sXQxALJbu5oFhVEwNKV2TMb1tbxjf3k2GkfBsa5duHfY9hYnUoLPF48rt4fVFr/KyVh5
         vEvO//AymqsRuJSpsYi6pKJBQIqdkVemovYVmiY6ZRzU2nIEdBzAHLOcf8wVZ+ikmZCI
         8L3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
        fh=+HWjtUqVnn/KQXnVcRuQ1KP0YJkKmlaarWlniDS8hHM=;
        b=csB6M0Zzoxp5EpKjdPmsqKlAJD7vOB3RGTTzg/T4aTypR7cANgT/rgKr0ph7HSwW7z
         0imst60x6f0hZyLmFLMbdkG5uDehjSYtywLHCrjInRr9tzai1Tgl05j/YKj6EAm1ytUo
         dtcbvr+8E2eHkjQp1NDwyP9AaXqMnzGa+0xAoddcNvVTKW8nbWm2pyv53N99qOVzJ42Q
         R7fdlTV+hgGCYS+qD9VD+/Ri90pHZoM86UAX/T3dRbbaxcdqQbSCooGUCWVP8l1F4mQr
         NBmu7jzejpTQHOoaDFOJ+/k/g7noxVqorALQhdUZEv8fMg+sZlXwQ0UPLDI8ulw7bI7J
         ngpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792783897; x=1793388697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
        b=fM4pp+17mA2W5prd1gKXs4asXj+KvPItU/RBUMEhZBpKcMtyDq5558E6+66GTgP1fG
         yPKZv9p894NBLrzFa+5RYs4AFfJXQb/o7xpkKp32dvCtr97FsbmkihOmGUCCLhtxuu1r
         GOGGXG96BmHYxArM9K4Fp//exMojM+ADNW4fYADcQBAlhhRKIiP/l9p7o5PkEyYXoz7m
         qHoycI7yEMC3U6Gxb1Tx/tM5ah1iu1duxm7tAK9BOKyejnzdQSUs7CjT1DAzuiaeHvMo
         R9tUcZKEYc8478yFiI0J5VyfsrV2pe3l7c8HGdX6rJqgo9USGvkieX6t5SEIUHqNk4Yl
         DTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783897; x=1793388697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssiACCz8iQhHfav075HToQsQkWyrJS6OaxDAqF1b0sE=;
        b=R0zUHUPD5g+PnbKgYWYMh0Vp5+yynnm6SaaTiO4yPFTEN5oKyVIO7GF5C3Ty9/r2pf
         Tu4C9CLZLKrvkXPHFLPkNMN+OA+xPj7YEHdUwMbhxBMYgCHRe372DjLC4Ia3HO7mfJpE
         a+M0QkGbrW7Z/m7EeTDv8HgnNvZArfF0LpDiTohc4phoeaNyjK8lUyI1skTlqz2iPsOQ
         ahsuu1sQIcNsMjy5GBBveUvONnmCjQYByJRRBs3hajDI7u2EIkYaF4thLlHZCSWbwI69
         VbuZEc7LxOn2FLfTvSiOU5WR9zJ4bxywHkuxva1cuYvtBTbGatEFKR6EvVr9MvbfcA5d
         hcwg==
X-Forwarded-Encrypted: i=1; AKwUvBz1ZS5u0cGm935VDnmHcbhiwLTdYvCKG92BY7kWvu50PbDvLd7J9Ob5m1tPshtx0RnX+w4lVd/xLOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOGMvLPTR01JBJSR1iRP24AJWkuc6TSViOlmUPHQQA5U0ZoaFo
	xUyvKpOvWh6YG7+YPEceU7UG65Gfxx4mfNic2nTZ9HHEFfT+HcbkCFAbiapt9Ne4puIKpHBKM2K
	HJNcdkikXPPiRc4oryQPooY9uxSQX9Cs=
X-Gm-Gg: AYBFou3JwxSVzuJ7Z4wDkEFaQ844Ffsbbz23rOPHMlIylM/isy90/Iq1DZU+4iw0KAK
	dUHFvP/k7iEgMIwgjwlS8Lm6+0Bi5axgRxrE+KqSaNlo/3tQuhhTybFoLbztmcdETVMievt9dlc
	T/GUY1FzbYHJSenUeZ8gBY7KHmpx64aohx1eEQ/PRTDR530ohTguI1+WOMShOrUBLPLz0aJL1V1
	275lLjiQi85HZ9Oex6NCGOHe0HjsHJixaTTQtUHJ3m7qZ8YEIVP51UuWQrbqBYPWJKYp0sGHyEk
	Fn2jnX5fgp0+uZGtDEzqNweDW3Bx6BRI7RHf97pcsy6xzPG0TPMw86uz/hjOkGsrrXJ0r7OKQMy
	AAb3jqrdhWlDZNU2tJOLY2f7tmtzFuwn57EiQEXT8OpdwyskSwiv8yWbRbkQKR/B53sazRyvVaC
	MzDW+kYFwYGvMckg==
X-Received: by 2002:a05:651c:31c2:b0:3ab:1dcd:934c with SMTP id
 38308e7fff4ca-3ac6fde7f59mr484421fa.1.1792783897356; Fri, 23 Oct 2026
 12:31:37 -0700 (PDT)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023174015.54793-1-igorpetindev@gmail.com> <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
In-Reply-To: <e16930d5-375d-4d61-9e37-94dc9a83ba64@rowland.harvard.edu>
From: IgorpetinDev <igorpetindev@gmail.com>
Date: Fri, 23 Oct 2026 22:31:27 +0300
X-Gm-Features: AclHuK-4Gcg0KL1Ua0F-idU5uezV--PxQTbQwTM_ejfi3csX_24NMPyMrJpzCac
Message-ID: <CAG21Q80vg9LdTRmFMC4aq7j=uEPWpEFNr3+1MLLUw_UU_cjd1Q@mail.gmail.com>
Subject: Re: [PATCH] usb: core: hcd: cancel giveback work synchronously on stop
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Thanks for looking at the patch.

I think the bot caused some confusion by talking about stranded URBs.
There are actually no pending URBs left on the list at all. The driver
properly killed all of them.
The issue is a race inside usb_giveback_urb_bh itself. The function
usb_kill_urb() unblocks as soon as __usb_hcd_giveback_urb() drops
use_count and wakes the waitqueue. The caller immediately wakes up,
finishes removal, and frees struct usb_hcd via usb_put_hcd().

Meanwhile, the worker thread on the other CPU is still running the
tail of usb_giveback_urb_bh(). Right after __usb_hcd_giveback_urb()
returns, it tries to access bh->completing_ep, bh->lock, and
bh->running. Because bh is embedded directly inside struct usb_hcd,
this access hits already freed memory.
So all URBs are already completed and bh->head is empty, but the
teardown path still needs to wait for the worker thread to fully exit
before the HCD structure gets freed.
Would calling flush_work() on both BH work items be the better way to
synchronize this without the concern raised by the bot?

Thanks,
Igor

On Fri, Oct 23, 2026 at 10:15=E2=80=AFPM Alan Stern <stern@rowland.harvard.=
edu> wrote:
>
> On Fri, Oct 23, 2026 at 08:40:15PM +0300, Igor Putko wrote:
> > When an HCD is stopped/removed (either during module unload, driver
> > unbind, or an error path in probe), pending URBs are unlinked and
> > completed. However, for root hubs or HCDs with giveback done in BH
> > context, the work function usb_giveback_urb_bh() may still be executing
> > on another CPU after __usb_hcd_giveback_urb() finishes.
> >
> > Since the caller may immediately free the struct usb_hcd via usb_put_hc=
d()
> > after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
> > the embedded giveback_urb_bh structure after it has been freed,
> > triggering a slab-use-after-free write detected by KASAN.
> >
> > Ensure all giveback work is fully flushed and cancelled in usb_stop_hcd=
()
> > by calling cancel_work_sync() on both high and low priority BHs.
>
> Sashiko's criticism has a point.  If there are any URBs still pending on
> either of the BH lists when usb_stop_hcd() returns, something is already
> badly wrong -- that's never supposed to happen.  Whatever it is, it
> needs to be fixed in the driver that submitted the pending URB, not here
> in usb_stop_hcd().
>
> Alan Stern
