Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795438393;
	b=DkDdrn7XGErL9bouAu7kKFdUtEHVVCwJ7xYX+fk0wSVgYouWTvmP/MUwUccGnDlxacLP
	 whRDVV6+E3aSyv+FQKQAXwcsJLb+cnA7xfWgjALkK71SK59kRlnYf8gJ32s8v2tBNzYQp
	 FoKrnomp2k/FCWiVeSac5PHATcieWCjhlKk3v2sxl+Uweom/Kn28Mk2KE7tZ4sgg6IU6w
	 d9PLYJgi+mVHeOMjyfHRqgfXmB1bRznLWgDcAfGoWWbnJYMWTahGpCNoNz2DVTybwXZWf
	 T5Hxuuqkqcz+sNnB5I2ImHLmTPHB3oL5wKtgdeKcFmUYDKryWzGnIaPigGgmijXLmzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
	b=FzMtDiWIgZfoDOTc3WayHPZk54cAN1RlwjcTPdOYZ7R4u7Kr+1LXid+BJxWV9tvdmGSv
	 koC8fkrqR3psZdJN7w0h1OF4uzzsfBqPlRgmRZ4e88Alk16YupvnPWjnX5tEmZ8iGiouw
	 NRdF/f3chYzPYByiV53srhFHoz9VAucysh2EUa7Z9pdA7FwGZxthkIZr055q3EXnRdxsP
	 WALAEfAYNYurAc/M6y2Z/cAdF6SMx9mmAoPsYZwhxVlYzyPLGa/RUEHZOQoVHvIAFPglG
	 1nLUNo5aSmLjfAnbyeBjG58rst5F5FDTIVtUl/AnalRAreGmK99YOn/rK2ZxEDelpPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCI4vVZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0208A606A688
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 12:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0208A606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCI4vVZ
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so31532835e9.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 04:53:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438391; cv=none;
        d=google.com; s=arc-20260327;
        b=Eb8wnXtwCjQR+jw57LC0Vobs/hT+Pt4Q5/04Yby/DxW1Y81E3tsrs0oRZac+vceRka
         k5r/Ha+GVNfWn8lbdFnHcthCAAeyypUFWASm5zjoNKV8GiePuok4cxXaxjOS06h9dorv
         yFL3SOiqwBOg+3DrvVMwP6A+crLcmq7BjtKP+7mMpcJvn6VOFpXnf3GlqAr5jzMP82fq
         SR9EZ90s5pBhgtoUkiO8OdMGHBXmt0bypfo+w9yp2Sx2euEhqScuPSzh62MaQTg3/0EJ
         IbnsjNP4EEJzdeMp7EsN2rQGnyUoguXVE906v+gzMl3jmUIIoYFCvY9TqHF3vIHqUnZo
         dNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
        fh=pCzwVPomkcMg6xSZLZLWwyItbXtT1G3T/iYwRZluEEc=;
        b=XopcTH1IElz+QwfypV7eswPBCMyS0rAjXe6Wu6E7c1SCou93wY4tdWl54srkMna+FY
         qkKcfn6RCYjZceDjPAvYD3JGFKI3GAGfGkJb87sdMchtWl9UGqgC73QtydZKNf91+/zS
         lyjTw+DRiGjnvAIJR98T3DQ6+sxtaySAuVEGBkGQBEFZkkk65nf4sg60DiJHPqGdqQUg
         /+OLDDT8x1TgTINKlSR68sWIU+GjbF+f1y2794IyEncFkHuEI/CFoOozz44y5TxTokTF
         lrwruESJyHBsO1ODsvDF39W/RoabW7k16m7Xk6QiMFUFmJI6/El/4zJ/s6QzJ3Sz7lNw
         ZQ1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438391; x=1796043191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
        b=lBCI4vVZ3AImfYVQwelGg4Le5vW23+tuGC3/xUsa+Fb+3zMSryvMsAsx7A5A5phm8d
         Z3DO+OnEVdedmkOlfKp4jVpG84e1JYyv/HXtlx+R1KrgmOtgn2IuUIbiZg7LDwS4jSXw
         TdJDChey1AkpjJRQMCrIglJG5yyLdf/nnS1q+clZflq6Oz2xRRpMdRJEZGp8++oVUdsI
         e+UGcctv4cJZNA5zKAowM1Aub2jLqsNu9F3FXpsOcJ6n1D1U5tAfbxHNs9dm1M/bc587
         wUYXEuAsnYCvnygymyjLmtsplN6AIYnvPrQ8hdlIJARNmVKZx4K6pH0+QlkEV5isnmxg
         /yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438391; x=1796043191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0yg1sz6z1LgrzFlki/GWBK5XsyUfLYGx0Gadj864wg=;
        b=S3xAtFQti3uo6B4XbDwH7qsyCXvxBgjosfttr6HhCK0Dp0p5vZ2+qkkK2vi0zAHNF/
         7JdsbGUzneIeQ2GCqiBQoTBAfrh85OtNywb+FbLKVkRuDs37QXBp+VDWSosRH5krEMBE
         XuKHYW2Wam5Rovcg6YeT3DpbmErYuDn26Ek0i9sESBRP0Vo8MGJ4q++npEK1fYlCiDMr
         aQ8I0YCkd7YHAYYX8DiZZNJbqEhFF4NylBH6mKQuOtzHWaZoTIl2Fwkho1J8z9aCBxhr
         VImofzom4ldFUt7MhP+l/DTCVJZ++E9FnQsa06QRKgojhkNoX2MBq7MB4YqvXlXxBtf/
         eMvg==
X-Gm-Message-State: APuU4Z8oVYSsB4J2Ez5AFks7UwZZpd22YinmBae8l1Jexfm7D9YN3pSC
	x+juSn/mWz16U9Jl7V38cVigClVkMqWcae/jl4TxNZCYspbiktDzkdJgByLzTHRyelZgjJ1Jdk0
	MEzDy8ke5gUq6PwGP2JqCphn0uiVOIyw=
X-Gm-Gg: AZFdTZcF1EqDqxzZRpBoZ2sNBHio9BsPyQu5ke7lJfHncGYtoteQSm98/qx/Q3JphwE
	QwX5SSA4S3Ads3Ee/kZWEAgSdZkfbtVUcetX7ps7Lz+9Cf+FisOYZCyjw4l+gkdU0tSUvZEfSZF
	KdK2OI5avYl5diU2uKk9vd9GWBAvA7zTHJ/i0yj03OTaVtEEkMhCHVQnhjXLcT+5L5wZNeIK7Ds
	R5FGCFzIYTx79yd9hxNuhFBhGkpSuW6jE1lw6b802SDMvZIhkWcADc0f8ki6+wV5yjhMB4hz/dB
	6fpyaspCkEWJVKEz2qxZNk1XyvZ9O800QpTTeT1tLHnfpIereQQOxg0r99hAlAuOBdJgu6Kis1r
	nw6eKSNaePGMXzWW+GE7qGI5uwejW2AOvkmrPc1nhXzQNVe1WrPPH2t7Ehi8=
X-Received: by 2002:a05:600d:8402:b0:4a3:5a91:5f61 with SMTP id
 5b1f17b1804b1-4bb88806287mr176227705e9.14.1795438391173; Mon, 23 Nov 2026
 04:53:11 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260910105359.12915-1-syedtayyabfarooq08@gmail.com>
 <CAKD4hN7z8Mf-EXJ9DUhDuxzbbEWShGM1aSQ2=5SQ=8F1wfVprw@mail.gmail.com> <2026112020-reviving-pretense-0353@gregkh>
In-Reply-To: <2026112020-reviving-pretense-0353@gregkh>
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Date: Mon, 23 Nov 2026 17:53:01 +0500
X-Gm-Features: Aa3M54oQxzf2RUCXt22miSbwmYa7KIxFZwFzrBd-ICJIDPaFDZl2cuGB9KQ3gEo
Message-ID: <CAKD4hN7AhdD9qC9-7_w-0Xqv84kR33dtPF8yq+8NocjwNVyNjw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have gone through the concerns. Both points look valid, but I believe bot=
h are
pre-existing and independent of the lifetime bug this patch fixes, so I
would prefer to handle them in follow-ups to keep this fix minimal.

> If a concurrent USB disconnect triggers gserial_disconnect() while the
> lock is dropped [in gs_open()], it will see port->port.count =3D=3D 0 and
> call kfifo_free().

Agreed, this race exists today. gs_open() drops port_lock around
kfifo_alloc(), and ports[].lock only serializes openers against each
other, so gserial_disconnect() can free a kfifo that is half-allocated.
From my reading of __kfifo_alloc()/__kfifo_free() the likely result is a
NULL data pointer with a non-zero mask (NULL dereference on a later
write) or a leaked buffer, rather than a write into freed memory, but
either way it is a real bug. This patch does not touch that code path.
A possible fix is to free the kfifo from the port destructor instead of
gserial_disconnect(), or to allocate into a local kfifo and install it
under port_lock. I can send that separately.

> Could this wait_event() block the caller (configfs rmdir)
> indefinitely if a userspace process keeps the TTY device open?

Yes, that behaviour is pre-existing. The wait was what kept the port
from being freed while a tty was open. With the port now refcounted via
tty_port_get()/tty_port_put(), I agree the wait is likely redundant.
Removing it changes rmdir semantics (rmdir would succeed while a tty is
still open), so I would rather do that as a separate patch where that
change can be reviewed on its own.

Please let me know if you would prefer either of these folded into this
patch instead.

Best Regards,
Tayyab

On Fri, Nov 20, 2026 at 6:55=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 20, 2026 at 05:41:33PM +0500, Syed Tayyab Farooq wrote:
> > Hi,
> >
> > syzbot has tested this against the reported issue, and the test passed
> > successfully.
>
> Yes, but the reviews for it are not ok:
>         https://sashiko.dev/#/patchset/20260910105359.12915-1-syedtayyabf=
arooq08@gmail.com
>
