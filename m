Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C53E1D555;
	Mon, 27 Jul 2026 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141686; cv=none; b=PVaW24V6mRfc3dFTW3tf/c2QVx+vDgdNKHKbN3LcVrfGbW9lD67B1gm0wATolv5Hv7YqqQM/Kal6GV3tb0q+OWUUd6VB0Lm5s2ScbUS9JizWE9nM1y72SlnmBWAFZwEVGTuyIB26qnTBR0XRv/Hl8qjPtrQTAr3VfXCy3IJ0JRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141686; c=relaxed/simple;
	bh=SFN0Wcvh0CYZiQYkfMRfFNoFQUgK014vYof3Weid3+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/2OALAStlN/He7SmDkc+qcAQaz3yX4Hy1dE+d1LKXpS7xW5azid6M0SCyhtY+ibQ8sk3xjv25YM8i+8h4xJQNA7ls1uj3Xt6KNTy8SADwBueNzgirOreRXNyySbJdWdozSkbp9Za08RHO+V2C3VbJd1wbEXSGOs2ZH1W31XWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnVWEzTK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnVWEzTK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ABD1F000E9;
	Mon, 27 Jul 2026 08:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785141685;
	bh=dNd2TwjkZrt20Ojzv/eCH7NhBi6NhBwUaK+R5WktpKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FnVWEzTKN6pw2LyqUX4nuXgPT4StgQOtD+iINO7+/2Odf0a8q1HtI6gEdo6HkLcLh
	 HUaTJEHq+/Db1sq4RzBHMeHc6gRQqBo0G/+N6EXlxh8MRr/Xk7y/rH2hwiL7NVkMS5
	 kfFu9rPS6w1B/HEMBSM5696/OpXgQww50ci/5DIIuuh5l+UwbLnWkirXQK4T2ce6Ix
	 byaUD3yWZI/tN0LPPMogRTJ177itOjlwGlOcZHPq8wGARQO6zeBv7uWH3yQWRvLk5o
	 uRelePtQH393vac7eN4dGd0vRA38htVn3IAT68rbChOtwG7yvsnDkZyRN4rApQN2L1
	 d6mz1PALVznNQ==
Date: Mon, 27 Jul 2026 10:41:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amber Kao <amber.kao@ite.com.tw>
Cc: Jeson Yang <jeson.yang@ite.com.tw>, Yaode Fang <Yaode.Fang@ite.com.tw>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bling Chiang <Bling.Chiang@ite.com.tw>, 
	Eric Su <Eric.Su@ite.com.tw>, Doreen Lin <doreen.lin@ite.com.tw>
Subject: Re: [PATCH v5 2/2] usb: typec: ucsi: Add ITE IT8851/IT8853 Type-C PD
 controller driver
Message-ID: <20260727-cordial-wakeful-serpent-e3c74f@quoll>
References: <20260724-ucsi-itepd-v5-0-d1a83e5c9c77@ite.com.tw>
 <20260724-ucsi-itepd-v5-2-d1a83e5c9c77@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-ucsi-itepd-v5-2-d1a83e5c9c77@ite.com.tw>

On Fri, Jul 24, 2026 at 06:09:20PM +0800, Amber Kao wrote:
> +	ret = itepd_process_event(itepd, &cci);
> +	if (ret < 0)
> +		dev_warn(dev, "initial event processing failed: %d\n", ret);
> +
> +	ret = ucsi_register(itepd->ucsi);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to register UCSI\n");
> +		goto out_free_irq;
> +	}
> +
> +	return 0;
> +
> +out_free_irq:
> +	free_irq(client->irq, itepd);
> +out_ucsi_destroy:
> +	ucsi_destroy(itepd->ucsi);
> +	return ret;
> +}
> +
> +static void itepd_remove(struct i2c_client *client)
> +{
> +	struct itepd *itepd = i2c_get_clientdata(client);
> +
> +	ucsi_unregister(itepd->ucsi);
> +	free_irq(client->irq, itepd);
> +	ucsi_destroy(itepd->ucsi);
> +}
> +
> +static const struct of_device_id itepd_of_match_table[] = {
> +	{ .compatible = "ite,it8851" },

> +	{ .compatible = "ite,it8853" },

Drop this one. One of the points of compatibility is remove redundant
match data.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, itepd_of_match_table);

Best regards,
Krzysztof

