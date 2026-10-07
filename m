Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8B352C4F
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355578; cv=none; b=bhsVipqipKZeKf6zprR/FrYDHTo3EPGH+FqnbzoJfKT8SXC7FIHHROJMhuZpVb7ZlVnXkfGoSUQdtRAY6X3shlwuCdhO9WHfl+4TCyIljLxxYe10zuo5PROwKFK5D+wHLkIvSyPPn5ritBj7jh1BHA25etkblRj+ffXPSuIZHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355578; c=relaxed/simple;
	bh=R9RCSFx9RTSwogOcwKMbnF31ZisQeNmXBBKdG7KcgRo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PwwtsGKnRL6w8bVnHtJAvS6YXmB0xy8w2dokneUM6oY6IMx/G4BOwKm+dm4Uks1XnmGJYF5CGrntMQZeCUw1hz4izKAWmbpmeg2eTHS78gsao49G4R1fMVMpF4slRhvfzfDJI3ICQIB2NQnII0aMEMbcLkHalGCypMKPZOSHRDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J1K4Jthm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J1K4Jthm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7AF1F0089B;
	Wed,  7 Oct 2026 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791355577;
	bh=UaQ1yjpL+O7f9Ope0ZzBj8XbvZ1cF7ph4H0GqH8i6h4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J1K4JthmbhpcuidiNOOBdz0tcbQu3gfjNd8KhOgOcKjIz3C6AfXrHCE5fOxvC+UGj
	 8XyhXKnNE9eQ5yhdgD2x1/nSdpMVRZCvO82pv2jnkWuAJ4PfND0xaL7l/BVnYC1E5y
	 hzJ1FUPSGMGb4L3X7o6NOTv1Ftq9ai6iM6r7iOIhJghhT3xqRYfZcd7Fj74JCcwUxb
	 84IAEo2VJ7wo/wZJGod+35/kLekXIYV2C6Z1iTSDgtfhaueLZlUOfj2wWRxQMnUmvq
	 DXBrqKVWnmbylaV7kcG2z2vrSxTC1HvtT6xn3r600LAgAbKrur3SMx3wYokzx9m2Hm
	 B0QbJMbmUH8zQ==
Message-ID: <sashiko-outbox-162685@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: vudc: snapshot endpoint state under lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sung Byeongchan" <tjdqudcks0424@naver.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261007063054.26374-1-tjdqudcks0424@naver.com>
References: <20261007063054.26374-1-tjdqudcks0424@naver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 06:46:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usbip: vudc: memory exhaustion WARN via unvalidated transfer_buffe=
r_length
--

commit 8f3791b0614070178b7b8445680ee73ac6933327
Author: Sung Byeongchan <tjdqudcks0424@naver.com>

usbip: vudc: snapshot endpoint state under lock

v_recv_cmd_submit() finds an endpoint and records its type while holding
udc->lock, but then drops the lock and rereads both ep->type and ep->desc.
The VUDC timer drops this lock around gadget setup callbacks, and
endpoint disable clears ep->desc under the lock.  A USB/IP host can
therefore race an ISO CMD_SUBMIT with endpoint disable and make
usb_endpoint_maxp() dereference NULL.

Copy the endpoint type and derived isochronous maximum packet size while
the lock still protects the descriptor.  Use the snapshots for
validation, URB allocation, and pipe setup after unlocking.

Cc: stable@vger.kernel.org

> diff --git a/drivers/usb/usbip/vudc_rx.c b/drivers/usb/usbip/vudc_rx.c
> index 51bb70837b902..276f645734484 100644
> --- a/drivers/usb/usbip/vudc_rx.c
> +++ b/drivers/usb/usbip/vudc_rx.c
[ ... ]
> @@ -139,7 +142,7 @@ static int v_recv_cmd_submit(struct vudc *udc,
>  		}
>  	}
> =20
> -	ret =3D alloc_urb_from_cmd(&urb_p->urb, pdu, urb_p->ep->type);
> +	ret =3D alloc_urb_from_cmd(&urb_p->urb, pdu, urb_p->type);

[Severity: High]
Does this code allow an attacker to trigger a memory exhaustion WARN?

In v_recv_cmd_submit(), there appears to be no bounds check on
transfer_buffer_length for non-ISOC endpoints before it is passed to
alloc_urb_from_cmd().

Inside alloc_urb_from_cmd(), usbip_pack_pdu() copies the signed __s32
transfer_buffer_length field into the unsigned u32
urb->transfer_buffer_length.

If a malicious USB/IP host provides a negative length, such as -1, it would
become a massive u32 value like 0xFFFFFFFF. This bypasses the > 0 check and
is passed directly to kzalloc() with GFP_KERNEL:

alloc_urb_from_cmd() {
    ...
    if (urb->transfer_buffer_length > 0) {
        urb->transfer_buffer =3D kzalloc(urb->transfer_buffer_length,
            GFP_KERNEL);
        ...
    }
}

Without __GFP_NOWARN, requesting a size larger than KMALLOC_MAX_SIZE causes
the SLUB allocator to trigger a WARN_ON_ONCE_GFP. On systems configured with
panic_on_warn, this could result in a kernel panic and remote
Denial-of-Service.

Can a bounds check be added for non-ISOC endpoints before calling
alloc_urb_from_cmd()?

>  	if (ret) {
>  		usbip_event_add(&udc->ud, VUDC_EVENT_ERROR_MALLOC);
>  		ret =3D -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007063054.2637=
4-1-tjdqudcks0424@naver.com?part=3D1
