Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300362;
	b=hMcnTNqibTTytMTXQvJdktAYj8v4x7Q2sNFAlUzefTO566MKCzD4l3NHs+gsXKx/h1QI
	 5WLtale+yAxwUjkD0W26t7xBn7oeE/tiUXkRHJlu4OZrghkJ1l1LmocipG7vkQ+3sjWgt
	 s1JdZnR6uesdfO+wTNZrAoT8xmqt/5pT9rmZqMNc/UPf2ZxSNBJyCLLiCfoL2rztZEQkf
	 HLdAl2N3II+VgWfshSo4XpFs+JyyDbt3QIhlwHbQzuStxRYeBShtrjBGPIw3l3O7Gtprq
	 2tefKS+pebx//ehUVSf0bqjqlldVpSBlfyiRyWL7XaW8Eg561VfqbSVATpHehYwgcVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pDdwdwnPkDpwaUGvrR+GyxsXOY4KK8QRKqRhYcUlZH8=;
	b=OLYqu2hixhGxckkNwXP0UjLG8IB76VXhnPgfJLvC6IkFsqd9DX/i64LGKMI0e3S9iNVC
	 dqcS1ciwcCo7MVcL7Wl/hZJh67e7ivGWKDjkvzo9L4d5CL3F/DiYMjqiGXG6AU0ONqZlW
	 7Jgvd5ZLhiSXgv+DBdcMvxsX+ukMnJwNXWeBfvVdRjdXOq7qttwaPtwlgTDdT6WnGYU+A
	 I5WEoNzpHNtt5Up+cE7tQBrDMwVlb//l0agAmioznumM+PkUPaDZK+KEbFurHHUbSuYFm
	 fRfdoGuqXlIzy8Sgpxs1ZdBZcr7UjlsL6fw4rEfiElbGfHFSbqMxrBGojuTsC1m77Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSwEv4VA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9C7606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 08:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C9C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSwEv4VA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so13196805e9.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 00:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794300360; x=1794905160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDdwdwnPkDpwaUGvrR+GyxsXOY4KK8QRKqRhYcUlZH8=;
        b=iSwEv4VAOCNwexBeds3LoDqqNpNPJtJRAc5qW0O4SH38oz11qIz/2QOO3Uhhml1uYi
         4nglexAY/UNX+dEP9HT3j/7fU+TTwV56CiizORNNurqaFo85i4nB3fkbP4TKMkRLLfXJ
         BKJSEH/OMUG6c1XijG0s6oRzBvovdqdoAnXn0+zxNXSmADa9LGNzPTbcDOJne5bBfxl7
         Rfj+ynSyWm3KVA145YonhbTY9M+fyiDDsJebMn5Qc51eMjfC0aFUR9dpnAY7+BMDmCL7
         epFru3XdjFeWXhaPjqqYPFmOKEdvSZgyy23OulKGkzOz1cBjZ28sRRmF0Wq1l+RS4ONX
         fB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300360; x=1794905160;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDdwdwnPkDpwaUGvrR+GyxsXOY4KK8QRKqRhYcUlZH8=;
        b=zXmu4PZH6EgInhY9+VoxqPw/nFVW+4mZrvLB9pw2sqPRT4TmzrwKpTbwCfa5fLdcb1
         RddmxIEZBTAuDFOheWr5RebTdbJyPHe+DUajiwRXlb0AUJzc5uAYi3eGEca0QzHl+agv
         McnauxL4+SX4yC9Q9ZJgOASKWzffpBoZvbFSpXfKMBLrJCc90MuxQgsUf1BQoFjK1vDT
         oTc3Xnrrzuc9dSkTpIEW+jefXGVvLkMyGmZFU6DQDjy5o+L37Peg4+DRbQPZ5Zlw7QLX
         Cop8kDsnotdSxR5SKEwI1n+Q0i7TfTJD+UQDSaSs3xZ9Y56QRyQ4Ro/HQ9u4m4qvkbrc
         TRFw==
X-Forwarded-Encrypted: i=1; AL+hErHAWeWTU0Uqy6w6py/gOGuEcIsCXoR2gAP8wdngwA24Itv3IHLT/Dy+SknQKjzxnuCG1sRdG08Z5BU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L37DZoJ/dAvr+u7P0efL+fJh1/Fyko6ScgLAhMTRMHERqtKE5
	b6AVXc5pFhqiyvczAzs+mYezxbljgzwokJruSiVGTuuurqhc4Dih1pm2
X-Gm-Gg: AYBFou0DK6UmR7v94gMD2MLAi9k/iB37Q72QXsbzd44u2phQWcIW7KFARxD/NmEhdO/
	2bI2If84STJxzbd0T9aK+4HAY5R9R7eEDRfygjDm+8ieB/3LxYGGDkVQVu/jWxXvAPHTrMDQVNH
	fseDFkNcVDunYf6h+vR3jVBDcgkygqXK2VWYxrGnh8AX6klCfFxcqJ5veVpIvXUm8SwQ3jSL8vV
	ZRkA7uqOFfqF4BX2HIJ9X72++CG5OPw+y71vED6gO/2DAsaY8D73PkmlSUtv12qJXxL2bkPpuRk
	b75nI7VlgKtbc01HXltE/nK5nWrjKwxYbJWWJE/MjaGG3SrJ4IS/aniIC6657K26+1PwrF49Rkj
	t0f+dEC59Y/9yJo8whZYxDL8TuLqxyZDZrdOPUiWUWqNNY9oAAD7VUtaZCD+Tzd/rL3IZM9QArC
	EX4lX/9vew3WdHZY3nGFvT+5LY0rbO4B81ZvRzPh4sLtuabI5C51h8IEF3jbNMi8tor4/AfiB4w
	pNXP4yQB95cOIUeY4StqFtIDDmlIJoSqYNsiSMcOxPcpzAEJKxuIbO4Ujm3j3ur8kmnot+lonOL
	r9pzOqQZ5wADnQ35WMB3Z67+jwWNF7OL+D2oQQ==
X-Received: by 2002:a05:600c:4e41:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4ba02346e39mr25356735e9.20.1794300359821;
        Tue, 10 Nov 2026 00:45:59 -0800 (PST)
Received: from foxbook (bfj76.neoplus.adsl.tpnet.pl. [83.28.47.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm3700351f8f.39.2026.11.10.00.45.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Nov 2026 00:45:59 -0800 (PST)
Date: Tue, 10 Nov 2026 09:45:53 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Shunbo Shi <shishunbo@cmss.chinamobile.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/22] usb: host: fix a few spelling mistakes in
 comments
Message-ID: <20261110094553.05e693e4.michal.pecio@gmail.com>
In-Reply-To: <20261110075825.24946-12-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
	<20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
	<20261110075825.24946-12-shishunbo@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 07:58:14 +0000, Shunbo Shi wrote:
> No functional changes.
> 
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Hi,

Not 100% sure, but hasn't Greg KH indicated no interest in such patches
for drivers outside of staging?

I don't like them either, IMO the noise added to git-blame is usually
more annoying in practice than original errors.

> - * long delay for the handshake of STS_HALT is neeed in xhci_suspend()
> + * long delay for the handshake of STS_HALT is need in xhci_suspend()

> -/* Mult - Max number of burtst within an interval, in EP companion desc. */
> +/* Mult - Max number of burst within an interval, in EP companion desc. */

So words that don't exist have been replaced with words that exist.
But the text is still wrong.

These are just two random examples near the end, I haven't read even
a fraction of the whole thing.

Another issue I have seen in those patches are fixes to comments that
aren't even true anymore, but the author has no idea of course.

Regards,
Michal
