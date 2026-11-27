Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750403;
	b=iSUiqumt3Voy/KeUQpVnJaNH3pfbUZM2j/uhM52T5SEQ5/2JY3+FdrbWB/d4IStdpRRC
	 drwuQ5x0kpvR51MB31+eGmwfPZfEk1kA30QKZp4WH8gmqXozx8EhGMiWm/Mrg1WD1MCqR
	 aYPSe/uJFh19d0gP1tvlik9LpB2Ifj1xrKso4kc6+ZmcxcmfREsaXC7LDKn5aSWx7nNJT
	 Olr6UMScMOzaa49SZeEVxBi1z4uAP5dpAFiRgufMBXE3XmSPvPl29KVt7MCTVDUqDG6H+
	 wlYY1qc3t0JnE5wtYSqtyHGVl1mA+78GDGBi1jsGywf0+ZuV7p/y3VBGba6Jjo0Gm9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750403;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eIkcH79jgIyxCVIMS0GAw0VqwHjDQB/faYT9Ky8IOvQ=;
	b=vjfvqDe7kmOER+B2ClDZcumFeruaOnXUzybS3/iv0nxrPKJspvbZ/ERFJm5f+Tcwh2If
	 Lu9WjA9J35L6bl1vjpUTZrzeVxD4qfDG9Yx6IkbU/TSAWpagkR9UToach0oACyh6l+zKd
	 NE2vHjfY/el843AHPO0zMF9EmAXf8IgKlRNicofP95jBdqDuqXtRjCOLHGOexgU6TfE5Y
	 wqxmVUWLAVsnBd8qsPCJP19VyLOMguX7QlqOkZ/TGdlxnBEDh4ztl7JaycrH3CEMraT3T
	 UMkiJE0YTrc9Ao8cC5CiocEFTWM5E3kcF9Sqj6EqBzTSovEl5MpAtM3nyd6XpO2LFOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nzQO9QiY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4598B606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 03:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nzQO9QiY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F981F00898;
	Fri, 27 Nov 2026 03:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795750402;
	bh=eIkcH79jgIyxCVIMS0GAw0VqwHjDQB/faYT9Ky8IOvQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nzQO9QiYJsw70/d7xMq6ynGeHuxBPv9Ieax5EMlGllQPHsTvPtvDjhkSbgo/K/Gao
	 tAVhY0FAAkksV0qbcUjePQYQdx/LoVLn3nZBLo/SR24FlEceIeEtU0Fzb+CMwDxQV6
	 PULJKdtfKSW1b0raUBW2CHxNR4Y6pgzwLRbI8PbIqa/kOrEQJb7Vzb4m890q+lcLPl
	 EgCL33rD2OWco99v2GtUyd4d7em3Tu28IeqGO/t60X2NOP4leRcc8G9/cHV1WjRvG2
	 R58AHD/Rm2RVETTKmnrSDESYosJVYTDXZPXdKIT3UI9ARwmbvv3nFwN8Uvo+SEjbLP
	 MdJ/jUIFigbRw==
Message-ID: <sashiko-outbox-236543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 05/12] r8152: split r8156_init by generation
 and factor out wait_autoload_done
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261126033211.51850-6-nic_swsd@realtek.com>
References: <20261126033211.51850-1-nic_swsd@realtek.com>
 <20261126033211.51850-6-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 03:33:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] r8152: uninitialized stack read via ocp_read_word() in
  wait_autoload_done()
--

commit 0f2651263a34885a605f72b9b63dba4999d285f2
Author: Chih Kai Hsu <hsu.chih.kai@realtek.com>

r8152: split r8156_init by generation and factor out wait_autoload_done

This commit splits r8156_init() into r8156_init() and r8157_init() by chip
generation, and factors out the PLA_BOOT_CTRL AUTOLOAD_DONE polling loops
into wait_autoload_done() using read_poll_timeout().

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index e58b010c734ad..a1e7a33b2f50e 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -4177,6 +4177,23 @@ static u16 r8153_phy_status(struct r8152 *tp, u16 =
desired)
>  	return data;
>  }
> =20
> +static int wait_autoload_done(struct r8152 *tp)
> +{
> +	u16 ocp_data;
> +	int ret;
> +
> +	ret =3D read_poll_timeout(ocp_read_word, ocp_data,
> +				test_bit(RTL8152_INACCESSIBLE, &tp->flags) ||
> +				(ocp_data & AUTOLOAD_DONE),
> +				20000, 10 * USEC_PER_SEC, false, tp,
> +				MCU_TYPE_PLA, PLA_BOOT_CTRL);
> +
> +	if (ret)
> +		dev_err(&tp->intf->dev, "autoload done timeout\n");
> +
> +	return test_bit(RTL8152_INACCESSIBLE, &tp->flags) ? -ENODEV : 0;
> +}

[Severity: Medium]
As reported by Jakub Kicinski on v7 [1], can wait_autoload_done() read
uninitialized stack memory in ocp_read_word()?

read_poll_timeout() invokes ocp_read_word() on entry, after each sleep,
and after timeout expiration before evaluating the break condition.  When
RTL8152_INACCESSIBLE is set (or if get_registers() fails with -ENOMEM),
generic_ocp_read() returns an error without writing to tmp:

drivers/net/usb/r8152.c:ocp_read_word() {
	...
	generic_ocp_read(tp, index, sizeof(tmp), &tmp, type | byen);

	data =3D __le32_to_cpu(tmp);
	data >>=3D (shift * 8);
	data &=3D 0xffff;

	return (u16)data;
}

ocp_read_word() then reads and returns the uninitialized stack variable
tmp by value, triggering a KMSAN uninit-value report (and evaluating
ocp_data & AUTOLOAD_DONE on garbage if generic_ocp_read() failed with
-ENOMEM while RTL8152_INACCESSIBLE remained clear).

[1] https://lore.kernel.org/r/20261021005210.1254886-1-kuba@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126033211.5185=
0-1-nic_swsd@realtek.com?part=3D5
