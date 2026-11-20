Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199322;
	b=Mbv9XjRA0/9mqMD51uy18oQ4EnRxoHoZ62kswIH3aE8HT+vIZOpIF6+jHrc4BdDgkB4l
	 o88DWspTK5+Nz8mtHD47jcgjqwKy1bNHiS1yJkn9tJQk569kYbjiCU+JyNb+FhxaPBHSi
	 U29f2SwL3Ip/eDglDaVcRZr82I1+Xpc5KiputO66McoxW4/WZUsJ9PIiBRMfpDtl8nHfe
	 ByFvL8Buy/d4/AA8cHljEANPTmKYTsv1a0RmCJMEl0veV5cxgUw2a23wHI0aoisLTZHQC
	 rESBopqerbDWVqPY7T65eD/SDrxV/CWXJ1tSjZ7PZgh76sGc/twSaO4yR9Oewjvksjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199322;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wU0nwzufMaP61MtihLdeXpseUgGJVAyxVeg48jVu7Wk=;
	b=5fWZoykn2hLjS+F0dlCj9vaD2tzEmyYev1Hhu/zJXLnu7thMn0nA+03LwZR4A9Pznn59
	 hETbdku0S0iHvBPOhdvuklLI3FC8obqVb1uiYkVXYAo4ZmgIworX4rz7nR2/QnVtP5gv0
	 VHgpNvRMaDznwW43AE7P6nPK2gKrHRNdTu8lKHl40Bnaqj6++syUnwrHYfxxyWORea3zZ
	 ZteJU5Tw2rzpDkKrACBRm1Gz4kXXy0eUIvgTLYb3HblgAXf1XubDsPxM85LtXST+q2M2I
	 5yIBabwiWrepAJEQgTWizWcmspA7CL1miviMxnx/QF9LblU6RH78z0hM+3+MRZH/gAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="En/PzgCb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE721606A32C;
	Fri, 20 Nov 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=En/PzgCb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3391D1F000CF;
	Fri, 20 Nov 2026 18:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795199322;
	bh=wU0nwzufMaP61MtihLdeXpseUgGJVAyxVeg48jVu7Wk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=En/PzgCbLuakLil6cMyBsPFphXJC4c2ZBo2fQ7cQfyqQRPIP9QDbR31xdueCic2ki
	 nsAuwg2L4mF6GpLAzupFYcbL58nD5TdctL9qJr9d6nxKdWywkWd2UZBw8lxeeSu0xG
	 N09KhYgMuq3BevlF28K4X07Gsl2f0V327gKlNT6YuQGD32pYlRVgoAKo3sdQH+SJA0
	 2nZUqi6pd7JuTJ3z47pP2Jvti1QwAQgmpatJx96KxHCI1/daP56qpX2gqZmkY1SrHz
	 M+tYlPBs8i3DgAQYUi0v5tUSdJSDrOdPtH12M5UjNv0nW791wSBdR4PrrLplimsKLL
	 44/hzqSbWjRlg==
Date: Fri, 20 Nov 2026 10:28:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] net: hso: fix stashed tx skb leak and replay
 race
Message-ID: <20261120102841.260c53f2@kernel.org>
In-Reply-To: <20261118141658.1381-1-chenaibing@cmss.chinamobile.com>
References: <20261117084732.297-1-chenaibing@cmss.chinamobile.com>
	<20261118141658.1381-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 22:16:58 +0800 Aibing Chen wrote:
> hso_net_start_xmit() stashes the skb in odev->skb_tx_buf and stops the
> queue when hso_get_activity() reports -EAGAIN, which happens when the
> USB device is suspended or no longer configured.  If the interface is
> then brought down, or the device is disconnected, that skb is simply
> left behind: hso_net_close() and hso_free_net_device() never release
> it, and hso_net_open() clears the pointer, so the skb and its data
> buffer are leaked.

Please stop submitting patches in reply to existing threads.
