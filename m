Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA61C4F55C0
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787634; cv=none; b=br21wrXtuguGlIIqvEOhr8HaFX1taPfW8JPwD0FBXFTpWdty8fTDXEWQ0Qa5BHrQZQjOstRn1mXT9KhOT5wwwzRvmNvx81xG4dwCh4KKFz8xw5osZ/FFnSei/efgJxcrtDMbsRXzSszciaho7t6k+9A96QQiciRysu20oE0CzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787634; c=relaxed/simple;
	bh=BfSa8Qa4HHA9XdtDni3WI6484fC1X2X/LXoDqzeOHac=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rxAPOvxVDqzWaj0bXTIh0ToB7NrcWZLCpCVBWcktwAMFtYETfPGm1HbvaFLwBOSbCid4HFeav03TvbyDLb5CTvdDRVjepQdGL0RKs6AyFYZu5KtbvHHt/UPdymws+DrJPzEyob8bdTlDFyi9DP2NUG0zmkLOIyF2CsTCa8RfK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=VBIa2i6+; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="VBIa2i6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1788787628;
 bh=y7VvGigwn27AdfNBSG1mKimtn1nQapTyJ3WDolaxsys=;
 b=VBIa2i6+ncS/ag4McrfQF0XqNDdQw1T3J0ZhbJigCLL9xdHZZadRNHqgoKd62GZ4EIVqhxuM9
 x0vDAByrOdzeFjl8zHYmclTO28xo3xwCvrB/dN8wMaSl3nxXefFQIZmBFqYocV9K8iwwiRr7IcB
 zh88s0dtZXg1zGmH2cXlTnIPRIhHylXcr+7sO3fseVuyAM9HB0L7s+49KdFmnGvsT9s4Z2FgMiU
 XzdC4yF3KvF+ziWqGKA0OdkfAM1qJcDvF+WtzBfAnASsLP4NHVvPD4O6ABEAuzNOFL8DkVievgF
 2fKSdVctK0+c/8aQIbRmYxD3gV/gPUQ1tcA34x6mFjLA==
X-Forward-Email-ID: 6a9ebbaa16171017b32ba5b2
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 07 Sep 2026 09:27:04 -0400
Message-Id: <DL94AI9QUZEG.LE27ALKI8UIX@ubuntu.com>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 01/22] usb: typec: Add alternate mode state notifiers
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Andreas
 Noever" <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>, "Philipp Zabel"
 <p.zabel@pengutronix.de>
X-Mailer: aerc 0.21.0
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-1-1f80085f93fb@kernel.org>

On Sun Sep 6, 2026 at 2:36 PM EDT, Sven Peter wrote:
> The Apple Silicon USB4/Thunderbolt driver needs to be made aware of
> cable details and whenever USB4 or Thunderbolt is entered. The cable
> details are already available as part of the typec subsystem but there
> is no way to get a notification on typec_altmode_update_active() so
> far.
>
> Add a blocking notifier chain to each alternate mode and call it
> whenever the mode is activated or deactivated right next to the already
> existing sysfs and kobject_uevent notifications. Replay activations when =
a
> notifier is registered.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/usb/typec/bus.h   |  6 +++++
>  drivers/usb/typec/class.c | 59 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/usb/typec.h | 16 +++++++++++++
>  3 files changed, 81 insertions(+)
>
> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
> index 7df5deb1dd3a..4dc60c48c91e 100644
> --- a/drivers/usb/typec/bus.h
> +++ b/drivers/usb/typec/bus.h
> @@ -3,6 +3,8 @@
>  #ifndef __USB_TYPEC_ALTMODE_H__
>  #define __USB_TYPEC_ALTMODE_H__
> =20
> +#include <linux/mutex.h>
> +#include <linux/notifier.h>
>  #include <linux/usb/typec_altmode.h>
> =20
>  struct typec_mux;
> @@ -23,6 +25,10 @@ struct altmode {
> =20
>  	struct altmode			*partner;
>  	struct altmode			*plug[2];
> +
> +	/* Serializes active state changes and notifier registration. */
> +	struct mutex			state_lock;
> +	struct blocking_notifier_head	state_notifier;
>  };
> =20
space/tab formatting
