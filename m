Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793151775;
	b=FdBMRPsXhfg7V56ycxcZknveQLFEHcFT+sBK3C4Wfxni+JyLRmsTLU3jZ9vQ6RxCSS5t
	 rYUwbMmNdUN67rsi/R0q4JJkeAISScfeexIOKt1ZQTC4Jh/OzbZFUCk5HWpGW2LRXjOXa
	 o4sqVmjklq2DZwpe46nl9v2FyxAdXjoEhe5SAoNWu8I7JEGIzkjHyyXJDcL1sOKeWqhpd
	 IY+eRn4JZp8iQWSLq7XwKm6Qw0jOxGt2Etymh5w1dqGlikUgJ/oGhJu7URcdd67pB9Ht0
	 fcD0++FjFbB6T1EQnOVVrIjevIaV9DlD82mXjbJQiPjL3e0Fg74m8RY+2VC5sWZ3k9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793151775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=F2b/C//SFL1IpqmZ4dlyGzFHOKnAQfZ+yoE8clPtWLc=;
	b=wHbXzQ9j1D6m62BJmUULhS0QiE1EzmhB2gti773WeK7pJfbalhXE5YWosebDhDDddk8Q
	 YaH/Bqf9ULSKHkID10Ey2HgFNiS80b7cr/F8MNai4joS169sJ9bOutuXy+u3c0r0STav9
	 SRZI3AemX4V2c8JMyzypt0INefG5tB4KT3XZpKQrdaP47pGm/au19vGcKtF8HWuZoHuIe
	 KbeCJESCHsAFmiuArWBirDki6JoU0fHGAmvwZcMK6sXD7XyTJvhqtn8LYWFv9OgjaVPyq
	 0jUTqvZQEHJygwRv3GVw6CYbG5epbrUxCFSGbd/XmEIZqPfJAbh3DpWbfVzJsD/BTTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCMyzx2f;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812A7606A31E
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 01:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCMyzx2f
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c49c32650adso10849866b.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 18:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793151774; x=1793756574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F2b/C//SFL1IpqmZ4dlyGzFHOKnAQfZ+yoE8clPtWLc=;
        b=MCMyzx2f0O00kIhRhwK1oGv7GzOGM3BLrIKelATcKFUe4QwLqj7MiA8Q/EnhpSe6Vr
         EHS/TnDyRCP8uH71IajLTDSYGUBp/FTsCTQVtV28oysp77bX9vzw10IrhG2nIOfdTQ5K
         8pjhKSSPSrVDS0lS1ipyWioAQ3/BsKkcKIE7VyoZyqeJ+9qZ/wDCP2D3oqpkUTVEuZFg
         0+S3lX4RdVHPnQgZrf8vtTWRvWHMJiVnD+nl3POTGLJohGZDJ2f/CXrqwtAYe0qb0we7
         pqRD4xj8sLpBFdBLnyjUnpHefy+IiU1w9ZTy/vYZOZ2D+srGLO3+h1N2j7eqHdRrimM0
         ngSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793151774; x=1793756574;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F2b/C//SFL1IpqmZ4dlyGzFHOKnAQfZ+yoE8clPtWLc=;
        b=YNS79fbqg4ngNnJMnf1UaXLqma+kIxcBdFgRuh+INfwU4SsPFBvolzczI/Rejecv3p
         b3J8B2lls2btJafWSCBsMkynXfcvwAQRQeepPYQFTr0rBFFj8YwVvxGDjwCk/+CQFr4q
         JZx/f7mU+N5uxvrCGi3+bfxZ6kzxUoDhvngpoqu0EIW1Iunastjtr4sHrleAGDP4T9Tm
         wvyKOXRr2Vi0FE7H3LNC/2DinsVu9WYflLKYawWcumVesLxrE5KlLoh0oZbKtj+Y8/s3
         wuQ/QfW3ULdCBexMlZm2bNnrzShHsDDHVVBjZtFTZGt1l2hQ2iXuWSKFFVz6LjuWfk1+
         FpYw==
X-Forwarded-Encrypted: i=1; AKwUvBxU5+eFlNSxwjSDQRQJ7QCFCcS4C/4Qu331HUUWEnOC17p5SSKJEF8tFNgXHYo+wbYbuu+pBx7jc8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlMrliGbIxdmXzEnaau/wW7p2O7OTlGQNHm+G7FJIT3hrsnTJm
	yfvIFAPm/ETYgPeRr/Psea2ObewqjT9FZHhPjvSdLxq6r7q5RWw06607
X-Gm-Gg: AYBFou3IpdE5bGEdk2TmQN7NcJ5BoppqJGk5Zsp2+GtD+qN9hkv0yq3zejDJil4HlOK
	iajPzSDyeZ09J5XKKO7nDT3c2kSfyrHqrxKX0Js35J+JGHq2jq61rhWiWPPUeYl8ZEFaQ7q0X+d
	e1jIxi81BDr9DTrKaz+ZnroNkj6d2uSNMuE3mudc20WdEVcYIZToU7H2bCVmisoOY1vfXGaioyu
	Jp2jCPXkT5lRSWzbe6YCWp1Z+xMQdBnqXUT5qhWFFvAp6kyAR21w779PSy8CeOeEIbkbIkp6qVO
	VPaLupndR3N6VtDubMjVTmHT9s0vSJzOFr3Xu/bqNrANiP+L4RCNKuV99e0eLGRf/puVhB5VfcR
	DiSnJnbpACgARet2xI34cZEL4kv7x3yRSknE1sYtLmu7WvOltuY+ez3Yk0d5sxxqLZctxYtsQfM
	CvPdA/koEnjuoDZFTbPnEpljo8J97jyKiIN1bgsNXohpiZ/GiKB3FtZC7FBUEMjgkvoj0aEffo7
	LKhUeGhf4HoEv6OQitjPPU6RZ6ih9WAOMWg2uEhuRjTP3ARI63QuGLEQnmXEWD90wltJURa6GFF
	2+n+7pYalZ/SQDfr3pbJz+UIppz/c8UDomlNDnrOs+NZEwc77CfyCPh0rEsTwJhdSlQYzAS+V70
	NxJjZDsVoT+7CRb9TXTkX9Ql2lb1H/u2AHK2USa+JopjMbFbEnN3Aj3TYoaeoT9yxUJJ0Kt+cyH
	XuJkdPWvVDzqwfHSMttAfJKAjQ2QgM86gq6ZH1B6l9c80N2RgEmkj8XQAO+myn9HVt
X-Received: by 2002:a17:907:2d10:b0:c3f:153a:8663 with SMTP id a640c23a62f3a-c49bdf3abbdmr75122166b.23.1793151773813;
        Tue, 27 Oct 2026 18:42:53 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm217876066b.23.2026.10.27.18.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 18:42:53 -0700 (PDT)
Message-ID: <096b2691-238e-4f43-b5b6-e1565b62664f@gmail.com>
Date: Wed, 28 Oct 2026 02:42:52 +0100
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: gadget: u_serial: pin ports while TTYs are
 installed
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neill Kapron <nkapron@google.com>, linux-usb@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mehmet Fide <mehmet.fide@gmail.com>, Brian Ellis
 <brianellis@gotenna.com>, Johan Hovold <johan@kernel.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Ai Chao <aichao@kylinos.cn>,
 Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
 syzbot@lists.linux.dev,
 syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com, stable@kernel.org,
 syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com
References: <6941beb7-8cae-4cc5-ba07-e1c8a8753fe1@mail.kernel.org>
 <20261022091359.1187468-1-krystianmkaniewski@gmail.com>
Content-Language: en-US
In-Reply-To: <20261022091359.1187468-1-krystianmkaniewski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This patch also fixes another syzbot report with the same cause,
"KASAN: slab-use-after-free Write in release_tty":
https://syzkaller.appspot.com/bug?extid=bca09f5d8b843bbf7571

It is the close side of the same lifetime bug. gs_close() drops
port->port.count to zero, gserial_free_line() frees the gs_port, and
release_tty() then writes tty->port->itty in the freed memory. The
tty_init_dev() report is the same race on the open side. With this
patch the TTY holds a tty_port reference from gs_install() to
gs_cleanup(), so the port outlives both paths.

Tested in QEMU on the base of this patch (usb-next bdf12cde3083) with
the syzbot configuration and C reproducer of that report. Without the
patch KASAN reported the use-after-free in release_tty() within a
second in each of five boots. With the patch five runs of 300 seconds
each (about 8,600 reproducer iterations) showed no reports.

If the patch is accepted, these tags would close that report as well:

Reported-by: syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bca09f5d8b843bbf7571

Thanks,
--
Krystian Kaniewski
