Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005812;
	b=EprsRZ38BRgLVQodez/TC5xQfJqOPPDeQhGzSNSmg45H8kefec6raEmELwKweC/1g6bH
	 /lfEttsoQ6rO5rL+30if52mlFRt7og/M3Lrcz9jWx2BCqicBB2ZvzpezT+EysL8yCX4fo
	 5yuZiG9BGx34boI646lCB3hA3E/SUEKfW1PA8SykEZfbLHupef0+5eMjXKXrw4cwVQhCb
	 lrhF6o5wYzZjL3b2Yqkf1MNhk0qhom/XLFozsDlE8tsavF8jDUb1do6HSm3rqQdP/jMZ6
	 S/JzSsi8kSENKQWLoA0bvbb9Zs7z/tkgwi/uyUQiMEbZm6b4TgTY6ZL7lexmc3ac1aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=J9vwvbzd/ctK76t4ubDixFhgtUMVVnh0YTdKHyIKAw4=;
	b=liPR//O0n/sqJfIJHG0W+qF4JIQG6/jLu+frA+zB1CtycFb39wP++6bN0+pJjQM9t80S
	 MbEUkKHAWCzI9wOSOk5UKnIu9TfBZH5q0q4NDR9jJfid63AJ2BOTWvfYxQ6kVgAn/an6o
	 f37m57FPt6iKfFt97S/yxMSdkux8DTsBHm29QKQdgZkN0Ej0YmteTLzZbd42NU4KTgJ8z
	 345iZO3i/RmSQThuXUft3KuSyL/qKU5w3L/mFJKcXpIyhtnwQLcGfm7MU5E6XkB91kaat
	 mKeNkJgTV/mS431Epl5h0GEHNi/wMZMumSZFN4MCrX3hKib5NoGZrYIEhy9HeV/oggA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KLpPmno8;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DF606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 09:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E6DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KLpPmno8
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1686546f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 02:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793005811; x=1793610611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9vwvbzd/ctK76t4ubDixFhgtUMVVnh0YTdKHyIKAw4=;
        b=KLpPmno86j460EDRfT84X20OKWtIXvgUsUC+wpT9yqRQ4+BoIun7QBXytto9ElBp0/
         KIDqNXLLP5Blny2inmfg82h3CWQOJcNHkLHhcH92hW69E8udxMSxUM5FB3fu9A7JXris
         1A9dxPOSvEQ9kQISRcrolVCqu7UC3LLoh/SMfPByM0lPsKn8CHM0xDs+Jy1Ewg6WCxv3
         fD/h+rFIvCUoa5d0FKtD7Veo2+zib3FMVNgCuE2BcJJFyHvegVU7NoavMKimwZljZIlh
         YMOrWcFO0JS5Q0+bJWOZVAxN7XeG4RhusZ3EAWk48GFv2miNtAqREDqMFm2o0pen+I8w
         k91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005811; x=1793610611;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9vwvbzd/ctK76t4ubDixFhgtUMVVnh0YTdKHyIKAw4=;
        b=m8UjNkr1+1V4byaZGJOSpo9xub7g6cI5sGYy/KVvtTYmNh59CwM4MUiF0DRqyBaEtf
         YRGHfUAVXsmc+1wIe7M3pFkRnifEmxEtu2L6C5FpBf2ONr6atFKX9rYZ1mbf1bu+16Pn
         5F1ksrj/BjBU/M1tgB6DCzXWwAXCfmriISsdKuLHwwas7HoprCC4SnpDLaALbElasHzH
         jfhmVUmnEpgs4qRVl6AvSesG1/qWTQmN0OaRdgPxFC371FQH9yrtiZuGs+/d1MEnfUP9
         lbtu4FCO21sOplxtPcb134PXdpuAVIUJOcnbj9WGYpAvfYTm5sjsCfk2z+Osp+Pieb25
         Aniw==
X-Forwarded-Encrypted: i=1; AKwUvByD4LA9uYzDqK7YQlmNgDHJLDVN9ZLTjHJ830xlni91G9SMknRPd/o4mKs6vhacVbWSGWfQQgFSmRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwIcrBy+Ucy9yOPf+B6qXOp9oWEBU1vBXQy+G5plOVkn4q5QE+
	v/8a9whglmDuSyTMFciGGPRNCgyjONcmZikKWb3MIrlmH3J0DFPIzuLR
X-Gm-Gg: AYBFou1Li8W4c0klrdkGqUUCm36pFbP0MHcIdRhUffzx43YiCpHuF0+FVoEghauRIOG
	sYlKYCwP3IJXoYM9sgPYTjlXEc1E2lSQGveCnUYOp7Wp4qcFdS99TfWS6S5uq+ZZS//jb2ROA28
	L725+2tJq38ftmUJBgMP07kPJ/l7eCZyMChdXzIik8q7i0Bciu3poFq73djpYXrk1VMAcnLeiUZ
	btWq8uLVw5rcXSSVEV8PvIVG9uTjcgcS8QumgZWzCzzqCyqBP2DGOKqMcP1yL1l/ojZhAdc20r1
	azY82PxO+LXm/Yc8d68g/WBoQMddHaglEdUIE1wUjhM62vOj7gd2LRwPInmSjX24aZjue3x1hpW
	08xMPQ9/NNnxe1QmvEg+YqN4R6ZgNhP4OmOvn0PLiMnP5Y+55JJa/sfHSvTKoYZIz8gPiVMz5C5
	R8vxqipoYxddpzcKVVa7xTTmshs3CzrwHQAs+woRjITa6gAa4eWw9FTZvqWa7DgDUWoZSvMd8d1
	Uc1K3rvWYa/Yi+oH5uDCD9tAR32H1lfSCNFKh8IbmYQ4uHzYcp0aVZkVg8mPFsDN86S0bDB0P7p
	SUPMt2J7f5s=
X-Received: by 2002:adf:e906:0:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e3eb9c276mr7811949f8f.43.1793005810570;
        Mon, 26 Oct 2026 02:10:10 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm16086753f8f.11.2026.10.26.02.10.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 02:10:10 -0700 (PDT)
Date: Mon, 26 Oct 2026 10:10:04 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Tseng <henrytseng@qnap.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] xhci: handshake timeout overrun and configure
 endpoint hang on device disconnect
Message-ID: <20261026101004.37f02f78.michal.pecio@gmail.com>
In-Reply-To: <20261016101141.42602-1-henrytseng@qnap.com>
References: <20260930101752.15794-1-henrytseng@qnap.com>
	<20261002113012.271ceead.michal.pecio@gmail.com>
	<179136673328.386669.9410030239460428155@qnap.com>
	<20261008110642.56567a92.michal.pecio@gmail.com>
	<20261008102522.109308-1-henrytseng@qnap.com>
	<20261009173516.681681a6.michal.pecio@gmail.com>
	<20261016101141.42602-1-henrytseng@qnap.com>
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

On Fri, 16 Oct 2026 18:11:39 +0800, Henry Tseng wrote:
> Yes. I repeated it on v7.3-rc5 with 2-1.3 deconfigured first, so 2-1.3
> had nothing left to drop on disconnect and no command was issued for
> it. After the USB3 root port reported the disconnect, the configure
> endpoint command for 2-1.4.4 (slot 8) completed, and then the one for
> 2-1.4 (slot 6) got stuck.

So there is something special about those hubs, but we have no idea
what it is and whether any workaround is possible. Using the DC flag
isn't helping either, and basically

> I agree the kernel isn't doing anything wrong here. The idea of patch
> 2 is that when disable slot follows anyway, this configure endpoint
> command doesn't seem to be needed

This may be the only option and I haven't noticed bad side-effects on
any of my HCs when Configure Endpoint is omitted before Disable Slot.

However,

> > Maybe it helps to re-connect the device before abort begins?
> > This worked with Renesas :)
> 
> The timing is a bit tricky to hit, but I gave it a few tries and the
> host was still declared dead every time.

Should be quite easy, you have 5 seconds before the abort begins. But
this result isn't good, it suggests that your patch is prone to a race
condition: if the link disappears for a moment and comes back before
USB core calls xhci_check_bandwidth(), rhub_port->connected may already
be true again, the workaround won't fire and the HC will hang.

We really need something that permanently "sticks" to all disconnected
udevs until they are reset or deleted, like the former VDEV_PORT_ERROR
flag which has been removed in v7.3.

I have already suggested before that the previous solution was better,
but Mathias didn't seem interested in reworking this. But I think this
cannot be avoided in the long term, due to issue like here. Per-device
flags really are the right thing to do.

> The only hub I have at hand is a 5 Gbps one (05e3:0612), so I tested
> with it between the root port and the enclosure. On v7.3-rc5,
> unplugging the enclosure from that hub doesn't hang, and all
> configure endpoint commands complete

What happens if you disconnect the 5gbps hub with its children from
the root hub? If this fails, we obviously have a problem. If not, we
still won't know. If you think your customers are likely to use these
devices behind hubs, you may want to get a 10gbps one and try.

I don't understand this bug so I can't tell what result to expect.

Regards,
Michal
