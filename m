Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467264;
	b=dl+2OGuP+D2zBFO9wkU5bITJHl+PPsny3MvUwuCWlOlH35jOe3VTkSjqS/H6UW+cVVnd
	 l4saxw+bdl2ixbE7EUzUDuvaR9OyCJtV4AhYK0zI72+dRlWmdhTd7/xbi3JTi8IelP+kB
	 3jAFYWJ1yJoQrP7i2HL4n40BBg8JF/y8afxtZLCl9vQ7+FWTPbQNIeyoguCzeAf0yw958
	 RWyVFo5XfhGHArgqfcdqE+/foan+GYkI+7ymHQJpMoGbyTbFj40HAKtNV/BnU+xnyLdCK
	 cCCcmqnocqPCl3hPvPKe6I73ki0vAIQb0iL5hMSYIaL205iLy+y2x4ZpngCYCnCxowA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467264;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2//YoWSOq5dYQBQQahPIBv6U4QFWTeJ5V1uNMemqYDo=;
	b=3Z6IySQAZtbp3AZ19uZ5DIXCdGUFU52zTMHDbYyFGOs99UTho5QyqKleXyWOB112QyA5
	 /VnTMWM0Ro439mvsU2fXZ4nRujZ/Yv374AwGUIyL0c6dsQdSD9RSWMSZncaE3YT+VS1r3
	 mj/aO6CucOtG62OgRiYu8fu9N/PZTMFeqDe3JzG1SCK01husCG/9mNI+h6ZatwXadghED
	 XGbQio2rpT53rOL9Do4Nf58DtzQAZNocKBJhmRluvsHTx0cHmhD6BumTv1uieTau4AR0C
	 2h5VmbaQ/CCLyXCzPhb0lmobFI/I810DRZdFgIfQrWQBcfsM+klC6/RvHi7DZskhBgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeiybPSp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBC606A32E
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 07:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SeiybPSp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA7A1F00A05;
	Thu, 12 Nov 2026 07:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794467264;
	bh=2//YoWSOq5dYQBQQahPIBv6U4QFWTeJ5V1uNMemqYDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SeiybPSpoVJh69/ZWxnNis/UtV6Tr2Z6NP8wEcgPYac9FX8jaJ7uYT2Njof5L4clQ
	 FOxneTf44tnD0GAZDgwqDiF2r04LFzviF4kGL8e4btvuIse20h/2V7UH5AnZux7NI7
	 OXYt9NdNi9mxjpdMTFEUgDDbqv/o7G1cM4Cpae9kJ3BKxuzRWAs9d27/Ow9GuLWOaK
	 1H1pUWm5tjoHxRnql/5R/Xqk/UKWr18aTqHg08/rmyC0ANTCQ1ra3iEhlcM0wHXOrc
	 6cZukDb9JiH8HM+dHrJZggZeG61UzCuDIVYk2F3UqMqZJP1lUmwdR93NxCdfx/n0cC
	 sjEFBOmOfh5XQ==
Message-ID: <sashiko-outbox-210571@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: hd3ss3220: disable the interrupt before
 unregistering the port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112065613.34182-1-mhun512@gmail.com>
References: <20261112065613.34182-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:07:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] usb: typec: hd3ss3220: IRQ race in hd3ss3220_probe() and
  hd3ss3220_remove() [1]
--

commit 2013fda123b6f1830f8ccc3b96427044ac637553
Author: Myeonghun Pak <mhun512@gmail.com>

usb: typec: hd3ss3220: disable the interrupt before unregistering the port

This commit disables client->irq in hd3ss3220_remove() before
unregistering the Type-C port and releasing the USB role switch.

> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 60d6de9ba3399..19c5dbdc97a1c 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -554,6 +554,8 @@ static void hd3ss3220_remove(struct i2c_client *clien=
t)
> =20
>  	if (hd3ss3220->poll)
>  		cancel_delayed_work_sync(&hd3ss3220->output_poll_work);
> +	else
> +		disable_irq(client->irq);
> =20
>  	typec_unregister_port(hd3ss3220->port);
>  	usb_role_switch_put(hd3ss3220->role_sw);

[Severity: Critical]
This problem wasn't introduced by this patch, but can the same race
[1] still happen on the error path in hd3ss3220_probe()?

drivers/usb/typec/hd3ss3220.c:hd3ss3220_probe() {
    ...
	if (client->irq > 0) {
		ret =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
					hd3ss3220_irq_handler,
					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
					"hd3ss3220", &client->dev);
		if (ret)
			goto err_unreg_port;
	}
    ...
	ret =3D i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
	if (ret < 0)
		goto err_unreg_port;
    ...
err_unreg_port:
	typec_unregister_port(hd3ss3220->port);
err_put_role:
	usb_role_switch_put(hd3ss3220->role_sw);
}

If reading HD3SS3220_REG_DEV_REV fails after devm_request_threaded_irq()
succeeds, hd3ss3220_probe() tears down hd3ss3220->port and
hd3ss3220->role_sw before devres frees client->irq:

CPU0                              CPU1
hd3ss3220_probe()
  typec_unregister_port(port)
  usb_role_switch_put(role_sw)
                                  hd3ss3220_irq_handler()
                                    ...
                                      hd3ss3220_set_role()
                                        typec_set_data_role(port, ...)
                                          <-- use-after-free
devres_release_all()

[1] https://sashiko.dev/#/bug/linux-37ab65bb-ba98-4e43-a446-fe1182fefabb

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112065613.3418=
2-1-mhun512@gmail.com?part=3D1
