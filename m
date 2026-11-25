Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604375;
	b=SKFO6TfYblKrxqDdKJWxS05/fJQUAsFESuV+lXyVbCMYSQXiNHsiVD5ywFQdGSQ6dUXv
	 KryPJZr6qmUpvtZFYLZ4+dc9UJwTpYkmbKWEVj+2f+gofC8Tcy+S9uCdtx0DW5RBTwKEh
	 mLmeimO5jsS4JC5txR9vOJKb7qfb2uscorCtQ55UR163/Sv/oHnNjCN2Yn5w8B16nYH/A
	 9YnJU65S2ccnTJYMONSwTdAT3vbF9QJEdmppSVE4TE3y2w91KN/6T55OuioHHiz2boaKm
	 I3/9q7gIbw+Z+9Vc01n5IO/IBhkZakKJFzrDDggOnoxoTXuIV1KW1PicWbB3FFhmkFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604375;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZLKlPy4M/9VKTsSCQH8nI4ioj39h537wWKmjP78gUTQ=;
	b=dyDD0vo5orkNYucfQ/jyR7VToMPH0fZvu3Olh00IX5qXBzeP34ee3sKHVbKTKR8V8WZY
	 4kS4CQVn5NBl/fRnNbk8p43/QHKhk39QF5lWXM6uyZ3XzErwTGHhsXUI9D4XlnhxdjBcK
	 WiBi3o/E8HjbbUl0uWNNZ12SLyjiBe2439DEcju/elYQTA4VscCFw2MPDdld0U5j7dp4W
	 OBo1/ZS8+x0Oz2iOBigLL/EZOtoMDFLJ7FLdvIrV83Vy/w5F2sKO+39uBxdTdgmIsfXpu
	 YZVVHW3uSPZ7URYolsc8aoNBsqZRwVfsI+4oPKI3pyO064S5H97Pmor/vGwbIlPfSJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fgp4ONNq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB0606A323
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fgp4ONNq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7771F000C6;
	Wed, 25 Nov 2026 10:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604375;
	bh=ZLKlPy4M/9VKTsSCQH8nI4ioj39h537wWKmjP78gUTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fgp4ONNqNYORGgKUjcJ3rRq5o99MfJFh0WrCCvkkUMYEtsCMSQFyXpLip/BNdY2E8
	 50mxzsdaRkI9bOl9KjxC4XRES2B2yQZkCWoF23+chyNO2YPo/ixxWkgWZQZNn+/4m2
	 n1MApg6n6g7qGzN2iI8vR6/iQcQP51ZEemBvCqswFVrzBYMHcxvvSDBMbLLPk5qCyI
	 RkuJkMPc6NnFPlusz9lFcZZq5mZ9tWZY7McIh3wlKw/eRk/I7s+9eFsSQmPeSGZujC
	 fKHQdb5UQyA15gT2gYZ+c6cJSMjYiSdXAW3PwiaPq+b9vAOC2fBD5SOd+LGSRbGPvW
	 xag2Dm9kdjNyg==
Message-ID: <sashiko-outbox-233181@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: tcpm: destroy worker after
 reset_port() in unregister_port()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-topic-tcpm-core-fixes-v2-3-aede2a3471f4@linaro.org>
References: <20261125-topic-tcpm-core-fixes-v2-0-aede2a3471f4@linaro.org>
 <20261125-topic-tcpm-core-fixes-v2-3-aede2a3471f4@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 10:59:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] usb: typec: tcpm: unlocked tcpm_reset_port() before worker
  destroy
- [High] usb: typec: tcpm: UAF and leak of fixed_batt in
  tcpm_unregister_port()
--

commit 67e3181a0501c55343c7ba43d0c183fa2c194d28
Author: Neil Armstrong <neil.armstrong@linaro.org>

usb: typec: tcpm: destroy worker after reset_port() in unregister_port()

This commit moves power_supply_put_system_batteries() and tcpm_reset_port()
before kthread_destroy_worker() in tcpm_unregister_port() so callbacks invo=
ked
during port reset do not encounter a destroyed worker.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d0abe8100742f..5e68ce2ea1ace 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -9025,6 +9025,10 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  	int i;
> =20
>  	port->registered =3D false;
> +
> +	power_supply_put_system_batteries(port->fixed_batt, port->fixed_batt_cn=
t);

[Severity: High]
Can calling power_supply_put_system_batteries() before destroying port->wq
cause a use-after-free or a leak of port->fixed_batt?

power_supply_put_system_batteries() drops the struct power_supply references
and frees port->fixed_batt without holding port->lock or clearing
port->fixed_batt_cnt, while port->wq is still running and about to be flush=
ed:

CPU0                              kworker (port->wq)
tcpm_unregister_port()
  power_supply_put_system_batteries()
    kfree(port->fixed_batt)
                                  tcpm_state_machine_work()
                                    tcpm_pd_send_batt_status()
                                      tcpm_get_fixed_batt()
                                        /* fixed_batt_cnt > 0: returns */
                                      batt =3D port->fixed_batt[batt_id];
                                        <-- use-after-free

Conversely, if port->fixed_batt_cnt is 0 when
power_supply_put_system_batteries() runs, a concurrent or flushed work item
calling tcpm_get_fixed_batt() will allocate port->fixed_batt and take batte=
ry
references that are never released.

> +	tcpm_reset_port(port);

[Severity: High]
Does running tcpm_reset_port() here without port->lock while port->wq is st=
ill
active race with running works and allow flushed works to run after the res=
et?

Every other caller of tcpm_reset_port() holds port->lock.  Running it unloc=
ked
while port->wq is still active allows tcpm_unregister_altmodes(),
tcpm_typec_disconnect(), and partner PD teardown in tcpm_reset_port() to ra=
ce
with work items on port->wq, causing concurrent device_unregister() calls a=
nd
use-after-free on partner, cable, plug, altmode, and PD capability objects:

CPU0                              kworker (port->wq)
tcpm_unregister_port()
  tcpm_reset_port()
    tcpm_typec_disconnect()
      typec_unregister_partner(port->partner)
                                  tcpm_state_machine_work()
                                    ...
                                      tcpm_typec_disconnect()
                                        typec_unregister_partner(port->part=
ner)
                                          <-- double unregister / UAF
      port->partner =3D NULL;

In addition, when tcpm_reset_port() triggers a synchronous TCPC callback su=
ch
as qcom_pmic_typec_port_set_vbus() -> tcpm_vbus_change(), that callback que=
ues
port->event_work onto port->wq.  kthread_destroy_worker() then flushes
port->wq after tcpm_reset_port() has finished; because tcpm_reset_port() do=
es
not reset port->state and work handlers do not check port->registered,
tcpm_pd_event_handler() -> _tcpm_pd_vbus_off() evaluates the pre-reset state
with port->auto_vbus_discharge_enabled cleared and queues port->state_machi=
ne
with delay 0, either hitting WARN_ON(!list_empty(&worker->work_list)) in
kthread_destroy_worker() or re-running the state machine after port reset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-tcpm=
-core-fixes-v2-0-aede2a3471f4@linaro.org?part=3D3
