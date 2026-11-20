Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178604;
	b=XW2SLZytxF0p/S4xYMDYfirkq1i1MFJ2u2ktfSLJ+bnO0stuNPMAMdk/Ot/78LNEWA4Q
	 mmCqeSHrXURbWZaAPJbyfevSRflRr1kLuOaXoJWNTuPje91+eYy1pCwxuSREH9wYevGW5
	 FT0EfibBTqkdg/RC8vEEkUSM214Fa/gHw61Ja3Mp42mZgEimzbBXUHNV1sURiqHbK7BXY
	 iGpreGKuDZYe29GaLy4McbS5j7wx2ZfhYESe+QDPsImhZ5wyyjafNp5jik8zJLu7kVntq
	 OTPR+ZVNd562T2lYGMfU9NIp2lXXNPTjimsyxdIeMhgfiAPx1AqkmbkEopXNZYFDSFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=jK0rvyezyqqkF4VxNNPoMLfzs/JZm9OqeRs2F/fTen4=;
	b=xJtiWXp5/nd0G2XQmC+39IOLaNyldMIgZi+ri3Pcfhses4OgDhq1KqD4P7V4m/cWdDWf
	 v7VI6ILTN0kMU75bNbN2OQNnrhZw7jlRxOpRFQvRhLSPE8VToayIzBnOvId8XCC/pRhy8
	 dfAIBS2iUjC9/ZYaFpUaCH8cUBliB6tuofi2gEqPJx9B9baxCySg/6VfAamzrcwSbEpsE
	 Fj2eG79z8yN3DVCru6VC9zCXJonKK1XQMJI+tIsb5prGciQkMAWXNCuKAw2gjNWcyPRln
	 CLYuyiCBUFSA8gP5Zpk5uq54VpWeaC8sZGYfEMUt/tf0rap0kVwJyCaeG9yjLx6nasQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eprDStxc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 3D5DB606A326;
	Fri, 20 Nov 2026 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eprDStxc
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A5D361F000C4;
	Fri, 20 Nov 2026 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178603;
	bh=jK0rvyezyqqkF4VxNNPoMLfzs/JZm9OqeRs2F/fTen4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eprDStxcLuY4CYc59aP63rAsN92IXyqYNTbpMu8NPxLugMplqGuwAoFaqP9PXZ53t
	 ZY5ueJN26jaZXPJ9vsGfdPJlpnwBYMICUTPmDDjDRXCLtjOECau6rh0S+zqB2TDhoR
	 +mFC3jezq3PclqY1lFB1LkMkyv+6HVp0nld9GgyPl0iU/UQomdo2Z67cKPskkkSVjp
	 PkcX7J5da7OO2YP5S1AySq6xld8HS2Bwb5vaK75M/HBh1C1cqZGH3AbuaWApsPIpPf
	 2SXIkWRqO+daQv3fwWM7dVWVryHTl/WICo1y2MHrH4ZoiOGzX8EuNqm1VI91CzPHEi
	 +4P1irEufW1bQ==
Date: Fri, 20 Nov 2026 13:43:19 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] usb: typec: Add onsemi FUSB15201 support
Message-ID: <w22jphnqpinyxxycjsquculr35njviv222epkn5s6vhdyx6ux5@z3ywjslfixhv>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
 <rscry5clkcrwhqaz4hzwzqyg5ijujntv5vcajjqnq5ghbb7f5v@rkvbszy66g77>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rscry5clkcrwhqaz4hzwzqyg5ijujntv5vcajjqnq5ghbb7f5v@rkvbszy66g77>

On Thu, Nov 12, 2026 at 10:01:05AM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 03, 2026 at 12:18:04PM +0800, Shawn Guo wrote:
> > The series adds a driver/binding for onsemi FUSB15201 which can be found
> > on Qualcomm Nord reference design boards as a dual-port USB Type-C
> > controller.
> > 
> > Changes for v5:
> > - Hold chip->lock while seeding the initial port state in
> >   fusb15201_hw_init(), so a data_role or power_role write arriving
> >   while the port is being registered cannot fail with -ENOTCONN. (Sashiko)
> > - Link to v4: https://lore.kernel.org/all/20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com/
> >
> 
> Hi Greg!
> 
> Gentle ping. This has been on the list for a long time, has all the tags
> and no sashiko comments. Could you please queue this for v7.5? It's
> blocking the DT changes with USB support for Qualcomm Nord.
>

Hi Greg. Another friendly ping. Is there anything I can do to move this
forward?

Thanks,
Bartosz
