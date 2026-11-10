Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794293342;
	b=45WlbOLPta2w6wxl552kSr+T0D34zR4CvnVRDZJyiMDMRyMNflb930FnWDizUIkV2mHQ
	 gwsNDOYTzXCGDjRsyrTWIFGhUG0ptkVbzhfyUIED8eqnTuJ5k0QG3faxKdo14VcmOzmXc
	 6ZeZjmfRx9JGmF0/9fCBeTju1+pU1WkZ7XDuiN+yAWnWt2zqcNNkWW7vshEEznALCi+nd
	 W7a9NkJa8aQgFkzIciCd1V5rHDPKUgkGZ+I7LN2LXBMdyoZ8WGUssJn1RzkJRNyoRO0tC
	 72G2VCCvOLSyanCctTQtSrvWFFmCg9sl9E6JdMH4hxmvHoNcmv5twrIOt8FcEu4K3lA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
	b=0q1wCHW3bX7/BCllGngID1g8WmTjY70Vu45Bh9YNky6q8/OCZGrr3twImvxB6+PBYpXj
	 vZX7Wyfz3Vwd3sIwEVTJ1KUWpIpWfM/vbB5UWzRG/Wzh+d3Bfi3anJv7KUVAVcqfD4oXw
	 2kSSo2g0g0JV5b/X7Z8TEzygzQOZGCEjrPim7/PWE7gF/F9Oaq1J9hnz/ORT/LoX5bldN
	 BrGBmIN0HZJwuQxYT8M2TeJWUlzZ3ynmU05qzHhy08Mc2WqJ7ru7ajuFr7JwMM+mMTTcB
	 H1dTLVIMkzoE82+1iAI0jgKHXZrUh8ewAs/SSMAi8cTEFJV9N/9QmK8JblvLdKcEPpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="v/xFnZxD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC62D606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC62D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=v/xFnZxD
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c169ae1cb26so256643466b.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 22:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794293340; cv=none;
        d=google.com; s=arc-20260327;
        b=L6LgeIsDsLQE+YWGv/yeaRnNUq4h4glzGIdw9X4ZTGKIjHjufIwaIHCHfDAzumxV64
         P/wgn36gFxY3XF+C6CSII2zyFnCFoUMwgVHR+pWwYfKxYZt9RDIUL9nUk3s/Ucff8v6w
         iITlKIBiciBUUssVtbVApSAq+uBZD8W6SiW0ywYTgoSQJd4vvez5rPqfy42rDWv9j5jq
         TIIXpyE6LxNdrC53kxegZx4mYJ8VS4I3/UKNrUD4UsI6/z3ir1rovCHWrIJ9iMYe7PgG
         B7yX2i/IpeZBgZt+ipvcyBCn8Hf28B8DdOJO+osAjg47VztKTDbiA52N4/jH577ScA+I
         CFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
        fh=PbVRVItEssm/FCXDXcGfkxfQF6vlUJcdr8rC742F8gk=;
        b=gyGqKFRWBAERua+W2h/fWCMEbVg+ULLNY8fTKwUwua7TSOq5vYEWMymXydGDuoHUZF
         S6y+Hy0qRpZKKyg/cXFGj6erqMw/1fo43kjQP787VsCGIPU009cie/IGr1G5R4nHa8cW
         dAbagsg9xqufwr16zO0gPiubUlWuQZC8/qoyuyjsllhX7Dkwirh+5RWudA5BLfsbVFdX
         /vZAhdn/7Pa70wCbhdDNxI7wdAXujA3MuYl42Sguhd+sGCDS+KtwPgE/3GWoqXHONiI2
         lcsfQgnkVAFVuk5GpxtcPknWO7Wbv/Yo0J2nEZTRcCDT/2LkjaB+DlFG+NSda4Kv0zS+
         2cbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794293340; x=1794898140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
        b=v/xFnZxDW7Zensqy+66n2ss4c4o2iS+l8sXiArC22O+q0Tt298ZmgkqlFe/4tGCP7e
         cA9qy6Zy5WIy+m8L4XtILmziLwza8O9z0w3128bKOrZrPxsMhh1UtF35TxXjJCHGDA8T
         YBwGZYXXSlkvsyAAb396Rgz61antrvfz35ZE/VpkXfV3inrAI1BKiQnboCPKEB1iJsP/
         eO+l3d14L6sxjHT8LuIb7rUKE5V+38nosJzn6IAYihUiW0AIVwePe1vdseG8v5FGb+Bg
         cyyPPod57JNbG0oyfYPQHf8d+XKRWhhi2tqXEauZ1/vej6/9OikEInuylh9IHrLXoODh
         zLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794293340; x=1794898140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKyLVbUOrxto+yw0ERPnW2hFW57/DV0SAW81TWBnLaM=;
        b=cv+d0pQbfJma43FyXzD/KBlOUgRFMoR8MfrT85AySjubAWyzxUtBuBlgtAQmqTPuE6
         n2syQNLcLSNTxJwE/EkG0uwBlWOD/VRgDJMSm3c0h9ZhRcAKILX1hGJ68xolE8M/t0TO
         6RSZOyuH/0vZkFMT4nbt8fdnJDA95dpgDlhTIJMne2ddz8EbzmI2/2YKHj0472A0OuFV
         e5syWSS/WQ7fuLJb32lIvVi7VOmD+P7VuAjzCu0yN3j+XZ7EUyVu0yqs6SX6yg7yPpWq
         JmZgg8xv57dN8/lFj6yBLzmYE5+o/NCGBjc7W+S6J9OhpIMCBLcwdPfxt/VENNjjrY4Y
         QcFg==
X-Forwarded-Encrypted: i=1; AL+hErEchL7tbIm7ayVV3Y7dy30wQL0GYaJq27+kf4jqltva71c2PlR1sTb3ZEb8p5x8ZwCWf68wLc0OSpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6oKO3Bw6x6fim7ZLp3ls4UHcZMXgwRzlUESaYlg48DTCKvjGQ
	ktul/II2wwfkmSZJERSO7EQctWCzeSBYMq7aErxvpiGDiuGuMhXL+yyN/ZMqUETn/nwgKYwJ8wj
	8ubpfMMXQOrS2AasJTaCKLVmVs19jijVOuOwO7v/0eQ==
X-Gm-Gg: AYBFou3WqnzuZKxtiQAAjyN1ZtUDa2HoKFAjpiJPCg7rspZ8bzSPjuVfLJHsu6bENGV
	eRY9z0gw+NaiYSb8Ek8JZuItD0ye0udz64BTkG+o7105JDb9kK754IdcZcdJ0IjFC8v3lNOYqdH
	SFis36CrVjU/Gj2+aNhLdufPYH3BwvZBq5tXl5420uWKqzrQdmAbA/rmSl5n/5umTsHY1BIQIFC
	Dojbrmr8IL19g9uX76CcYJo5VKbU7JdMJK5ThpwfzH7YsHWjrsUJCWmTzk8st4HT/SeWy9qwZB7
	B6AlznJOQRCrPP9fjZ9eIcxjfv2KbYZdkxYi2Lp6Hx4o0Z0+pPRyEfpMyLDSNoFFop3JajYHzRo
	JaKB4JejNIjEbXqv9Hh+Y8BLVY0AkYr11HPPKbwA1T0/IT4raGnhLkowUpy/8zugxjBI/
X-Received: by 2002:a17:907:608a:b0:c4d:939:526b with SMTP id
 a640c23a62f3a-c5048c7308cmr131939066b.0.1794293340165; Mon, 09 Nov 2026
 22:49:00 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net> <au3KYk13lFTjhltb@black.igk.intel.com>
In-Reply-To: <au3KYk13lFTjhltb@black.igk.intel.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 10 Nov 2026 10:48:46 +0400
X-Gm-Features: AclHuK8C2BllbiAztLfGIWD27mCMRqMO8z3FrQU5M1iK3j9Y9ry0AtiAIQOgt7A
Message-ID: <CAKTNdwHpSNhtxp3eaUHt8N5ea6cwXPc6pE_HVVOwtGgk-xWxzA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: fusb302: Drop unacknowledged Get_Source_Cap_Extended
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:39=E2=80=AFPM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Nov 02, 2026 at 05:09:05PM +0400, Alexey Charkov wrote:
> > The chip mistakes Get_Source_Cap_Extended for a GoodCRC, as it apparent=
ly
> > decodes only the low four bits of the message type. As a result, it sen=
ds
> > no GoodCRC for it, but still queues it in the RX FIFO. The partner neve=
r
> > sees the message as delivered due to no GoodCRC, so it retries and then
> > sends a Soft_Reset. When FUSB302 receives the Soft_Reset, it finally
> > raises its interrupt, at which point TCPM sees Get_Source_Cap_Extended =
in
> > the RX FIFO instead of the Soft_Reset it just received, and answers it
> > Not_Supported, which is not a valid reply to Soft_Reset, so the partner
> > escalates to a hard reset instead of getting a chance to gracefully han=
dle
> > a lost Get_Source_Cap_Extended.
> >
> > Discard Get_Source_Cap_Extended, which FUSB302 can never properly recei=
ve
> > due to its inability to automatically GoodCRC it, and answering it from
> > the host within the protocol specified 250us window without so much as =
an
> > interrupt cannot be made to work.
> >
> > This way the TCPM view of the PD exchange at least matches what the
> > partner saw on the wire. This lets the TCPM complete a PD negotiation o=
ver
> > the FUSB302 with e.g. an Apple Studio Display, which otherwise always e=
nds
> > in hard resets.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks for acking it Heikki, but let's please hold off applying this
patch. My colleagues have done broader testing with Apple hardware.
While this patch prevents hard reset loops and lets TCPM negotiate a
PD contract, it can't yet complete Alt Modes negotiation in PD 3.0.

I've done another attempt locally to send GoodCRC from the driver
instead of discarding Get_Source_Cap_Extended altogether. It lands
wildly out of spec timing wise (close to 2ms vs. the spec-prescribed
250us to start transmitting GoodCRC on the wire). However, it works by
sheer luck because the partner waits up to 1ms for a GoodCRC and
retries the message with the same ID up to 3 times, so the first
GoodCRC lands in the window of the second or third retry and gets
accepted. Everyone is happy, and the negotiation completes just fine.

It's a bit more invasive for the driver, though (as can be expected),
and relies heavily on the bus speed being at least 400 kHz (FUSB302
can do up to 1 MHz) and not a single extra I2C transaction being added
in the timing-critical path before the GoodCRC goes out. I'll send it
for review separately, and if it proves palatable, it will supersede
this patch.

Best regards,
Alexey
