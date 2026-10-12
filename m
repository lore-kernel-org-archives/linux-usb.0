Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED834388F
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827145; cv=none; b=lhrtF9TFvTpSlVkOrn61x3CPJCU9XCCh8yQYDQYmmeVP/oJv+5/5lORYB4fsQTO83BtwhG7btkdFplrz1AYkG6p0cRzc6eRhJREuWWgJh+o9FOGNxrUhji4vo/TfYLTSA8AwXlTeE1RYcoUI9ipKLEabTteFRYrcsNB1FHCgPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827145; c=relaxed/simple;
	bh=CouVGNvWofLivm0/4heGf6MMeQ81HfIwnzO8d3j48BI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=U1Gs70q/QHWBDF7EmGPAsty+lkf1lv9sAyYClYsWQxu60cnrfw+FRtnfWbIDeslWk34OmNWey2CrLUpIli1Shk2SdU+fTcuYKCv5317uzmJg1SP1d8sJKFF+NovomLXYcvzzn86NmKQpi1DVzxclgTRLIqxBhzYZbrLX9MxjJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dnhys+M/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dnhys+M/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92851F0089B;
	Mon, 12 Oct 2026 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827143;
	bh=m5z6xcneRtT/WelvKztfcPRcHR+SyKmXUlHlzF8yr6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dnhys+M/I2SHRy/3+Zy9EdBYFuyeeSAoLJ+mDTQYhFZteMv650LKKYtm9tNabaYEL
	 XW/WwGrx+n4oDJy2TOCT2DUwbIHTJRDVNQjaH1jwm56Tgygf/uhoErzrb27cEaH/f8
	 2O1lvHKesYVD6xSiebO6qy4eS/nxSMm6oAGFY2HGH+XpeHWPpYaHaylK+cNcVvbiHO
	 v3zKMEGD/EdQGTqlD3F/IJ7Fo+mjjpNxv3yfSet3hUdYiV/XRsKbCk3+5NfkupTYWh
	 6HQWTkGqG8Iz5yhVDHj0ROQBkjmbqUkt6B1ajaf9r2OS1XblzEUUy37KpnVOrXbCQe
	 c/GoZJS44p0FA==
Message-ID: <sashiko-outbox-168486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/11] spi: Add NVIDIA LSTP SPI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-9-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-9-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:45:43 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] spi: lstp: missing set_cs causes CS assertion leak and bus content=
ion
- [Medium] spi: lstp: xfer->delay executes after chip select deassertion
--

commit b315e8ac97c56dc30f3204c3748b56ba5483565f
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

spi: Add NVIDIA LSTP SPI driver

Add a driver for the SPI controller channels of NVIDIA LSTP USB adapters.
Each channel is registered as an SPI host controller, and devices behind it
can be created via device tree, ACPI, or userspace. The firmware reports
chip selects and bus speed.

> diff --git a/drivers/spi/spi-lstp.c b/drivers/spi/spi-lstp.c
> new file mode 100644
> index 0000000000000..7aa908e6c398e
> --- /dev/null
> +++ b/drivers/spi/spi-lstp.c

[ ... ]

> +static int lstp_spi_transfer_one_message(struct spi_controller *ctrl, st=
ruct spi_message *mesg)
> +{
> +	struct lstp_channel *ch =3D spi_controller_get_devdata(ctrl);
> +	struct spi_transfer *xfer;
> +	u8 chip_select =3D spi_get_chipselect(mesg->spi, 0);
> +	int ret =3D 0;
> +	bool cs_active =3D false;
> +
> +	if (chip_select >=3D ctrl->num_chipselect) {
> +		dev_err_ratelimited(ch->dev, "%s: ch_%d: Invalid chip select %u (max %=
u)\n",
> +				    __func__, ch->ch_id, chip_select, ctrl->num_chipselect - 1);
> +		ret =3D -EINVAL;
> +		goto finalize;
> +	}
> +
> +	u8 cs_bits =3D lstp_spi_cs_map[chip_select];
> +
> +	list_for_each_entry(xfer, &mesg->transfers, transfer_list) {
> +		u8 cs_flags =3D 0;
> +		bool is_last =3D list_is_last(&xfer->transfer_list, &mesg->transfers);
> +		bool no_data =3D !xfer->tx_buf && !xfer->rx_buf;
> +
> +		if (!cs_active) {
> +			cs_flags |=3D LSTP_SPI_CMD_CS_ASSERT;
> +			cs_active =3D true;
> +		}
> +
> +		if ((is_last && !xfer->cs_change) || (!is_last && xfer->cs_change)) {
> +			cs_flags |=3D LSTP_SPI_CMD_CS_DEASSERT;
> +			cs_active =3D false;
> +		}
> +
> +		/* A data transfer fuses delay and CS edge into one command; CS-only w=
aits first. */
> +		if (no_data)
> +			spi_transfer_delay_exec(xfer);
> +
> +		ret =3D lstp_spi_do_transfer(ch, xfer, cs_bits, cs_flags);
> +		if (ret)
> +			break;

[Severity: High]
Does this approach to managing chip select state lead to bus contention?

Since lstp_spi_probe() intentionally omits the ctrl->set_cs callback, the c=
ore
SPI subsystem cannot forcibly deassert the chip select on bus idle or when
switching devices.

If lstp_spi_do_transfer() fails mid-message, the loop breaks early without
appending the LSTP_SPI_CMD_CS_DEASSERT flag, permanently leaking the assert=
ed
CS state to the hardware.

Additionally, if a message intentionally ends with xfer->cs_change =3D 1 to=
 hold
CS active across messages, the next message targeting a different SPI device
will start with a local cs_active =3D false. The driver will assert the new
chip select, but the old one is never deasserted, leaving the hardware with
multiple active CS lines.

> +
> +		mesg->actual_length +=3D xfer->len;
> +
> +		if (!is_last && xfer->cs_change)
> +			spi_transfer_cs_change_delay_exec(mesg, xfer);
> +
> +		if (!no_data)
> +			spi_transfer_delay_exec(xfer);

[Severity: Medium]
Does the execution of spi_transfer_delay_exec() happen too late?

The driver bundles the DEASSERT flag into the data transfer command, meaning
the hardware drops the chip select immediately after clocking the data.

However, the host CPU executes spi_transfer_delay_exec() after
lstp_spi_do_transfer() returns, meaning the delay occurs after the hardware
has already completed the command and dropped the chip select.

Can this violate timing constraints for SPI peripherals that require a spec=
ific
pre-deassertion hold time after the final bit is clocked out?

> +	}
> +
> +finalize:
> +	mesg->status =3D ret;
> +	spi_finalize_current_message(ctrl);
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D9
