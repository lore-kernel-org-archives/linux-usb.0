Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599FD32B13E;
	Wed,  5 Aug 2026 00:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785889707; cv=pass; b=tSbhkI7qT3d3tEFwUkQ117S9IjRGMhdr2sXGQfwpfENiHas4XaMxmpRKfqHhmUQUI0ORnrE/cEHHxp1UgaZLuYknU7vDd6tqWa6SJnQRx5nfaDi1DaL9KgBc33wBXRCEpU4hDwdJfTNVRly7wTBr3TkLgjBf/lI2CM+4r4iiwJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785889707; c=relaxed/simple;
	bh=Rifry0GxTBcDdPHHHVb7Db6ezEw2zQDIVEFxVBzo6EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDOJ3LUIdJruVB9NprnKjNYC5qPW8z0IqHqPa/NNNOq5fElRjPLfW7uCiHymwDDlSielBbSs2zM5TkgdklDsLIsGzJsaSWzG0+j7S/kHwwxIZ8NjwbykZTGdfNHSDkQk0/gNdKeBrd37BNG0mVyLW6/VlJDcxh9OaVmG0ejf7co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=LHF/HR19; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="LHF/HR19"
ARC-Seal: i=1; a=rsa-sha256; t=1785889697; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S0Ipn5FalBPkfz1Ixe1opiF6BRq3/1xdsFCuoYYJW6zcTx9ZkJsWJljilZMrZFQ4CMc/kh6yWWG+qn4bV9F01uDRgZNwKhlid/IqV3cCu+6OxhFaNG6m2CMHqTCj7vViIVsiWJ11bLNQ/bV+kwozOrLpBGlKXvWBYyUdz+jS8RY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785889697; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vuH8khJUAH33k7IP0mHY+EB4TYVx4kd32nMlS60utpg=; 
	b=II0mRt4XI8/tJ0V2urK189g8MyNdRvmx5TOiJudHvD4o9dN66aaea1igfksNq83vuF+S0vRAtVex2YX4/tn8bbxGLUnN6LY0sPXrAf6C7YIgWFeVecBpeSViXX9NBnixhEvEF8kA2DIlst09P1hhM22pB/8nKTLCBLBhyTox9PQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785889697;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=vuH8khJUAH33k7IP0mHY+EB4TYVx4kd32nMlS60utpg=;
	b=LHF/HR19jUrJHndV9gE1nCGFDAAlhXNVpWyBfTeJrsyp9uX2Xf/Hpz8Dz6b01E/x
	LbumB0DKfciQVyf5W6Afd0VyomlZYNvxTw9udokfqRw+UhtWg/uaEMOQ7t4wOcxhcgF
	QccRQpoow6OXoLUwtJaRU7MlkI+aYkCNH9SJRNOQ=
Received: by mx.zohomail.com with SMTPS id 1785889695811127.87027798637382;
	Tue, 4 Aug 2026 17:28:15 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 0E3F5180912; Wed, 05 Aug 2026 02:28:13 +0200 (CEST)
Date: Wed, 5 Aug 2026 02:28:13 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Haobo Cheng <i@4t.pw>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: mux: initialize orientation switch array
Message-ID: <anKDIaz2GWjdm2U0@venus>
References: <20260804083434.20885-1-i@4t.pw>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzfrkunizpmieshv"
Content-Disposition: inline
In-Reply-To: <20260804083434.20885-1-i@4t.pw>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/285.885.97
X-ZohoMailClient: External


--wzfrkunizpmieshv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] usb: typec: mux: initialize orientation switch array
MIME-Version: 1.0

Hi,

On Tue, Aug 04, 2026 at 04:34:34PM +0800, Haobo Cheng wrote:
> Commit a53b4f9c51a9 ("usb: typec: mux: avoid duplicated orientation
> switches") started using the orientation switch result array as state for
> duplicate detection, but left the array uninitialized.
>=20
> The first match therefore scans indeterminate stack contents before any
> result has been stored. A valid orientation switch may be incorrectly
> discarded as a duplicate, causing fwnode_typec_switch_get() to return no
> switch.
>=20
> Zero-initialize the array before collecting matches.
>=20
> Fixes: a53b4f9c51a9 ("usb: typec: mux: avoid duplicated orientation switc=
hes")
> Signed-off-by: Haobo Cheng <i@4t.pw>
> ---

oops.

Cc: stable@vger.kernel.org
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/usb/typec/mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 9b908c46b..55dab1c76 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -79,7 +79,7 @@ static void *typec_switch_match(const struct fwnode_han=
dle *fwnode,
>   */
>  struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnod=
e)
>  {
> -	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
> +	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS] =3D { };
>  	struct typec_switch *sw;
>  	int count;
>  	int err;
> --=20
> 2.53.0
>=20

--wzfrkunizpmieshv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpyg5kACgkQ2O7X88g7
+prxDg/9Gj7tPq1JUFQjoy7Do4Af/HiHKkAPoprqmMUSxKPxyitmT4k6Hgjp8z13
hCX1hXZIgDujTq+J4B0QaXOTLRmzZR8Z2S3DN0gcEnm4xq+0pWfPzpv+WwTsczfA
Nzob5WMgtLBL8grYR3WUlP+2CF8eLigaLy6HI8Ac9sjrh6YQ4y/vEZbQeLmFKjha
O2QjL60W1AMvK6Cses1AzXNFHe27DEa2YqnetZxNTUZiHTrjPpE3DO30MuY2PAR8
8hy+k5MeorfntKcxws8qiVZbXdL5FQDIM3riideniwhBXKZ5jO+X+Rv0p4hnq7iY
g6wFaz1Ra1ajyW3a+eMTVXJE6NccWoT0bTe+sLQRo+ef4egscUV2KdP/7opVr0ru
4+kaMShkzdY3y4jvyvZ90SPAWZXOpyerDmTs1Y7Eoh17GA6uCVNMTnA3ib/9ZrYj
s6An3lTAhllshxv9Tw3k1V0fOsGToDjdi+uTTR4JlrKTyRpCaG5PDT9sx0902fe4
QEe6Lz6D13axMhvp06S6FRfV2JjRbOeusWDHjn0gbYyLqFZxeL9W9lyn8zOgIAwb
MNcQD65fV+rZMFcyGcsQVeUaNhJdl2KUcWn6tKHOGDhe/abW4mv1SO0W3ou0gcaB
cDM1BDZGO+fHFCAYjfq/U3ullhs/XAr7dDbGJAxPb7dzIeoNhoo=
=qk85
-----END PGP SIGNATURE-----

--wzfrkunizpmieshv--
