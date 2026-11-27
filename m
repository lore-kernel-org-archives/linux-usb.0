Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805220;
	b=rF/ypYyIgNySb3Xuz/qVihk0RRN/X0mwrB00jjDFXHgSsIR/V5OGGWDJD6IfnL/ECAHw
	 FO+c0oR9IvpQV39DMQUzBvxH8mwKZQMqgszjqnm1nyXdT/Vu9flyBIPZe6zxfpYRcCm83
	 Q5GBHJZSvf6Pq1hYgm5HShcUgdKFs7t1gA7jxX7CA7nQ3rnPLmx16iE56fbNu+JvvkAbL
	 rqpycaEotvXqtakgSvSjNOSgki6ZhcbjB+FddIpBhQ0ZIVHsvJxfUFUixtJ17ZWSu4AEo
	 9AI07DipA0eqRjoiGdpVbdpHn5+j+xGrYLShk2NodtNmw7Oj6ci3r0iTvil+sPh5vVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=q93v57zPn2xmCbL5Y+J1Q4E4wvK5vAu0gKbayenJJrA=;
	b=LBxbpMVJ39c9ijQnbWIu8TIahcxZ/CoW1xuNyiGbqzMWBvaDWW7Z66pl67znqhaIpjJi
	 iezbneJeQTO9igPbJfUivC1Z5l6GGCDj2zUms3HX/UC3qSb6iECNNpEIzcUkGzIVaoteh
	 uKWmPaFVac1mPSjFGmBeviSx8356azfFgVQ/bMP8tU37Rp6QLOh/62HqR8la00IadMV8q
	 RuOQYRYwi3KIsyBSbHxFW/7OCzpxUVsihjAX6vTKpkr+VxBF8HppKOdfyhry+w2N+BgFh
	 8sc77Z0IU4v2l4Xh1kCx0LFba4oo8OA6uEpjN3RgO8ZOnxZi7DZNYkpsE25jYt/h3dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=certik.com;
	spf=pass smtp.mailfrom=certik.com;
	dkim=pass header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=Xm1IN39J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A418D606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 18:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A418D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=certik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=certik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=certik.com header.i=@certik.com header.a=rsa-sha256 header.s=google header.b=Xm1IN39J
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4d5e645d1so52544197b3.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795805218; cv=none;
        d=google.com; s=arc-20260327;
        b=OasLUGOkCqoKlNQxCm9yAAlgLqOcIyUTESNFfjUT4gMQOj5w4IrqKVI8/C7Pm3KhYf
         uMhfchw/uwtvViR/5g5aQ1LlSLxhDg8NknQkvQGnSpus6qoxcHYhmZQYDjv1xJX+5GV9
         8ARy/OlqrFf9Dm8KORGu0PezH1msMJK0fT7HgpybQWj0sDCz52OpzMky/6C3onbfFyzf
         nwaCJ16UtbSo7qLT0SmbBIPRVjUJcEZSXrUlghRajuK+Pww0t1qdHqgMp1I3K3l81dsE
         X7e9W8V8Toycc77J8Ukq0rn40Vril2gcSTcRgC/DbpDlryioIAtCoVdP7Gho9Smlkqar
         j67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=q93v57zPn2xmCbL5Y+J1Q4E4wvK5vAu0gKbayenJJrA=;
        fh=QZef4JfnYmth9EwwW6XjHabci7xhFDu04acEdmsVoPQ=;
        b=MdVkVwR0tyM8HwN6NAmZgQAcs+AEKZg9rRYx4sypgUXPLOu6uBmJjlMnKpm+l8WUw+
         RMjO4YRrLZOh3FGeia7XcilBRYlZvNjKkP8SnAEN2yH2dd+7zbHJRkIynkjV1WF+wNAP
         b+usdAloMRcPdHTKD/Q71dUtKpfk3B+vnFDmyGFIOzuush5M4NgaX4Ak8wnE56ovQ2qX
         QytXq0gN8i8zGSLVn8IuGnHFKgyhqQy2pqNIw+cpAG3YxJzJv5aCp+0XCtLC5RiKX+H6
         2zOMIlzNHL5cL1GTlKuZeKtJwSSNIO1/XtvIBex89wlTZy3hXK+QEW6CtASls6lheLfh
         vuyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=certik.com; s=google; t=1795805218; x=1796410018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q93v57zPn2xmCbL5Y+J1Q4E4wvK5vAu0gKbayenJJrA=;
        b=Xm1IN39JbYfouBl65m2amBwOsdhaPWai1WU5KIk0kgx46cniC166xgzldCRphxcXKe
         7AMkyDYsd4ctcExe8MgOmwgbou7pDOooPfyivspklGgB3zHgEUuE22xwWHdJJz7aucsi
         opyfq6qkHyy4CkiZQva4EPJd8yf2UXJ+94CC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795805218; x=1796410018;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q93v57zPn2xmCbL5Y+J1Q4E4wvK5vAu0gKbayenJJrA=;
        b=0nNHWjYBRIao1N85OgNlOgkbOpNPGKCpGUbSiPlUEJD3Vf2LEbMuIMKwlcPj4aHfcg
         3tyhbpYLw1qDtvIuwOjymBzYZz0LHSA7h12YdhYMz875OABu4SYGk7KnOO8fat63Tq/B
         yovbG1QRpvkW6dkBDnCohkx8Poi0dUst0ys6Ofbl4a8e9S96mOi7cBDfnkaatb7uGybv
         9j8Mtn/FOWVH/JJqRHUNvse/E7ctnTQgOix+4KNWSdmqtR8uWtV29GoD7ZmeU4e/8NVm
         YIzrh54KlpbtjFMLoAkCbmmvdr5fKeER/ym6XhuaPD44u3JGfMNEQq83TDpuXLSX+ZJD
         wdHA==
X-Forwarded-Encrypted: i=1; AL+hErFKmia+Kw1GHDzc4zLv4YyokaV+EOyYfcwkOi8SIoTN/FKPq3aK714NERXpYTkRPKw/ue0Zgq+XKNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qqP1qXE2gfwIvXg3FRUM6iFTI4otgYSCuBcXD7VoRq7f1L3Md
	Hw661HXHshaW3gC9ud+MxN5OP/KUPFj50MINoniGyiGC4XcYPCReriTS9dRXXmgdSfXT47D5JI1
	t6QnAE4E6wEvE3eMCRdW9H/nXJ1F5h0QHGHD4ja8iEQ==
X-Gm-Gg: AZFdTZdZE8ix7e4gHrKrPMEA8ZTw6AZ4FnxVwVuK4JfcjQLpepfi78mx44psinkMkov
	PszAPf0DFbJvEDb3XLyfGaaqHganRUvstekMcLhq/jLQ6Zsunpv0PYaKbyA3ixhn2Ojuhd0Saj0
	086CBybrlyNFXxzaDe5oxMnSJqvGxB1W3j/Bx7SRVIMeVKnWfJKhgKScaKfkeIKet/iA8rU9zbv
	LRlzAJyh+BzSARKxXyPQBTX0GQtcaSVPLg41wQ/go+F+xYDcHRTepOu42hbus+Kz9y8bqchA6qC
	AkvvnTTKpd0eydAnXCSER/mRsmyPAu/KoI37+lZtaVBiTdJa9rongAz5/REAuIAZjrAhfwXwBWe
	+N2lBrwYFScYskMmn4OxOeSVd5bPPl0aMauW1psQFZ45AP7EtYVPLJR1HcIOyWxy50W2fPrOZJ5
	q0obX43GKhmrnczuedFpzGdkuxWYxdmuDEz0j2rmLWRm1E2+p4Fl7H22pIeivD/HdTW3ZU1qtLr
	oKCGpxNz12mwIDutB1NBVRtY784J2gu9lrjZg==
X-Received: by 2002:a05:690e:4007:b0:679:c803:98d1 with SMTP id
 956f58d0204a3-67df452b36cmr9214072d50.152.1795805218571; Fri, 27 Nov 2026
 10:46:58 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 27 Nov 2026 10:46:57 -0800
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <2026112729-zips-gargle-7886@gregkh>
References: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com> <2026112729-zips-gargle-7886@gregkh>
From: Dickson Wu <dickson.wu@certik.com>
Date: Fri, 27 Nov 2026 10:46:57 -0800
X-Gm-Features: Aa3M54o7cosuMHt-QWhs8eHEQtBjHB9Qd-qez-EhtP8ls-KVf4RuqQcvKAY3A2M
Message-ID: <CAFaZ9ep6+cQud2+ehFevnv70+yhpmqiTD6iEpsFMBmkUjMcnWg@mail.gmail.com>
Subject: Re: [PATCH 5.10.y-cip] usb: cdns3: gadget: fix state inconsistency on
 gadget init failure
To: Greg KH <greg@kroah.com>
Cc: cip-dev@lists.cip-project.org, Pavel Machek <pavel@nabladev.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Ulrich Hecht <uli@fpond.eu>, 
	Yongchao Wu <yongchao.wu@autochips.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 01:11:56PM +0000, Greg KH wrote:
> There's no need to send cip-only patches to the usb public mailing lists
> (or any other lore.kernel.org list).

Ah got it, sorry for the noise! I'll keep the CIP ones to cip-dev and
the people involved from now on

Thanks,
Dickson


On Fri, 27 Nov 2026 14:11:56 +0100, Greg KH <greg@kroah.com> wrote:
> On Fri, Nov 27, 2026 at 12:18:44PM +0000, Dickson Wu via B4 Relay wrote:
> > From: Yongchao Wu <yongchao.wu@autochips.com>
> >
> > commit c32f8748d70c8fc77676ad92ed76cede17bf2c48 upstream.
>
> There's no need to send cip-only patches to the usb public mailing lists
> (or any other lore.kernel.org list).
>
> thanks,
>
> greg k-h
